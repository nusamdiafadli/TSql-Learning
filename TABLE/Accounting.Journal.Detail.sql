/****** Object:  Table [Accounting].[Journal.Detail]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Journal.Detail](
	[gl_id] [int] IDENTITY(1,1) NOT NULL,
	[hdr_id] [int] NOT NULL,
	[gl_idx] [smallint] NULL,
	[acc_no] [Accounting].[COA] NULL,
	[gl_currency] [dbo].[Currency.Code] NOT NULL,
	[gl_subcode] [dbo].[Description.Short] NOT NULL,
	[gl_remark] [dbo].[Description.Medium] NOT NULL,
	[gl_value] [money] NULL,
	[gl_debit]  AS (case when [gl_value]>(0) then [gl_value] else (0) end),
	[gl_credit]  AS (case when [gl_value]<(0) then  -[gl_value] else (0) end),
	[gl_fvalue] [money] NOT NULL,
	[gl_fdebit]  AS (case when [gl_fvalue]>(0) then [gl_fvalue] else (0) end),
	[gl_fcredit]  AS (case when [gl_fvalue]<(0) then  -[gl_fvalue] else (0) end),
	[gl_match] [money] NOT NULL,
	[gl_fmatch] [money] NOT NULL,
	[gl_matched]  AS (CONVERT([bit],case when [gl_fvalue]<>(0) AND ([gl_fvalue]-[gl_fmatch])=(0) then (1) when [gl_fvalue]=(0) AND ([gl_value]-[gl_match])=(0) then (1) else (0) end,(0))),
	[inventory_id] [int] NULL,
	[old_gl_no] [varchar](50) NULL,
	[cc_id] [smallint] NULL,
	[trans_date] [date] NULL,
	[branch_id] [smallint] NULL,
	[dept_id] [int] NULL,
	[trans_period] [int] NULL,
	[trans_currate] [money] NULL,
	[trans_paid] [date] NULL,
 CONSTRAINT [PK_Journal.Detail] PRIMARY KEY CLUSTERED 
(
	[gl_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Journal.Detail] ADD  CONSTRAINT [DF_Journal.Detail_gl_currency]  DEFAULT ([Accounting].[DefaultCurrency]()) FOR [gl_currency]
GO
ALTER TABLE [Accounting].[Journal.Detail] ADD  CONSTRAINT [DF_Journal.Detail_gl_value]  DEFAULT ((0)) FOR [gl_value]
GO
ALTER TABLE [Accounting].[Journal.Detail] ADD  CONSTRAINT [DF_Journal.Detail_gl_fvalue]  DEFAULT ((0)) FOR [gl_fvalue]
GO
ALTER TABLE [Accounting].[Journal.Detail] ADD  CONSTRAINT [DF_Journal.Detail_gl_match]  DEFAULT ((0)) FOR [gl_match]
GO
ALTER TABLE [Accounting].[Journal.Detail] ADD  CONSTRAINT [DF_Journal.Detail_gl_fmatch]  DEFAULT ((0)) FOR [gl_fmatch]
GO
ALTER TABLE [Accounting].[Journal.Detail] ADD  CONSTRAINT [DF_Journal.Detail_branch_id]  DEFAULT ((100)) FOR [branch_id]
GO
/****** Object:  Trigger [Accounting].[Journal.Detail.CascadeDelete]    Script Date: 11/8/2024 10:27:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [Accounting].[Journal.Detail.CascadeDelete]
   ON  [Accounting].[Journal.Detail] 
   Instead of delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from a 
		from Accounting.[Journal.Detail] a inner join Accounting.[Journal.Header] b on a.hdr_id=b.hdr_id 
		where b.gl_checked=0 and a.gl_id in (select gl_id from deleted) 

	delete from Accounting.[Journal.Match]
		where gl_id in (select a.gl_id from deleted a inner join Accounting.[Journal.Header] b on a.hdr_id=b.hdr_id where b.gl_checked=0) 
	delete from Accounting.[Journal.Match]
		where gl_matchid in (select a.gl_id from deleted  a inner join Accounting.[Journal.Header] b on a.hdr_id=b.hdr_id where b.gl_checked=0) 


END
GO
ALTER TABLE [Accounting].[Journal.Detail] ENABLE TRIGGER [Journal.Detail.CascadeDelete]
GO
/****** Object:  Trigger [Accounting].[Journal.Detail.InsertData]    Script Date: 11/8/2024 10:27:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [Accounting].[Journal.Detail.InsertData]
   ON  [Accounting].[Journal.Detail] 
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert accounting.[journal.detail]
	(hdr_id, gl_idx, acc_no, gl_currency, gl_subcode, gl_remark, gl_value, gl_fvalue, 
	gl_match, gl_fmatch, inventory_id, cc_id, 
	trans_date, trans_period, trans_paid, branch_id, dept_id, trans_currate)

	select
	a.hdr_id, a.gl_idx, a.acc_no, a.gl_currency, a.gl_subcode, a.gl_remark, a.gl_value, a.gl_fvalue, 
	a.gl_match, a.gl_fmatch, a.inventory_id, a.cc_id, 
	b.gl_date, b.gl_period, a.trans_paid, a.branch_id, a.dept_id, a.trans_currate
	from inserted a
	inner join accounting.[journal.header] b on a.hdr_id = b.hdr_id

END
GO
ALTER TABLE [Accounting].[Journal.Detail] ENABLE TRIGGER [Journal.Detail.InsertData]
GO
/****** Object:  Trigger [Accounting].[Journal.Detail.UpdateDate]    Script Date: 11/8/2024 10:27:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [Accounting].[Journal.Detail.UpdateDate]
   ON  [Accounting].[Journal.Detail] 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update b
	set b.trans_date = a.gl_date, b.trans_period = a.gl_period
	from accounting.[journal.header] a
	inner join accounting.[journal.detail] b on a.hdr_id = b.hdr_id
	where b.gl_id in (select gl_id from inserted)


END
GO
ALTER TABLE [Accounting].[Journal.Detail] DISABLE TRIGGER [Journal.Detail.UpdateDate]
GO
