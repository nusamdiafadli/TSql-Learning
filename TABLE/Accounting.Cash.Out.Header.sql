/****** Object:  Table [Accounting].[Cash.Out.Header]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Cash.Out.Header](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NULL,
	[doctype_id] [tinyint] NOT NULL,
	[docflow_seq] [tinyint] NOT NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[doc_extern] [dbo].[Description.Short] NOT NULL,
	[doc_date] [date] NOT NULL,
	[acc_no] [Accounting].[COA] NOT NULL,
	[gl_subcode] [varchar](50) NOT NULL,
	[doc_currency] [dbo].[Currency.Code] NOT NULL,
	[doc_currate] [money] NOT NULL,
	[cheque_no] [dbo].[Description.Short] NOT NULL,
	[cashing_date] [date] NULL,
	[cashed_date] [date] NULL,
	[doc_cashier] [dbo].[Description.Short] NOT NULL,
	[doc_recipient] [dbo].[Description.Short] NOT NULL,
	[doc_remark] [dbo].[Description.Long] NOT NULL,
	[doc_aptotal] [money] NOT NULL,
	[doc_transtotal] [money] NOT NULL,
	[doc_total]  AS ([doc_aptotal]+[doc_transtotal]),
	[supl_id] [int] NULL,
	[doc_reconcile] [bit] NOT NULL,
	[doc_desc]  AS (('CO '+[doc_no])+case when [doc_extern]<>'' then (' ('+rtrim([doc_extern]))+')' else '' end),
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_Cash.Out.Header] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_doc_type]  DEFAULT ((3)) FOR [doctype_id]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_trans_date]  DEFAULT ([dbo].[getlocaldate]()) FOR [doc_date]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_gl_subcode]  DEFAULT ('') FOR [gl_subcode]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_acc_currency]  DEFAULT ([Accounting].[DefaultCurrency]()) FOR [doc_currency]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_doc_Rate]  DEFAULT ((1)) FOR [doc_currate]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_doc_aptotal]  DEFAULT ((0)) FOR [doc_aptotal]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_trans_total]  DEFAULT ((0)) FOR [doc_transtotal]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF__Cash.Out.__doc_r__347F8C65]  DEFAULT ((0)) FOR [doc_reconcile]
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ADD  CONSTRAINT [DF_Cash.Out.Header_dept_id]  DEFAULT ((0)) FOR [dept_id]
GO
/****** Object:  Trigger [Accounting].[Cash.Out.Header.DeleteProtect]    Script Date: 11/8/2024 10:24:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [Accounting].[Cash.Out.Header.DeleteProtect]
   ON [Accounting].[Cash.Out.Header]
   Instead of DELETE
AS 
BEGIN
	SET NOCOUNT ON;
	delete from [Accounting].[Cash.Out.Header] where doc_id in (select doc_id from deleted where docflow_seq=0)
END
GO
ALTER TABLE [Accounting].[Cash.Out.Header] ENABLE TRIGGER [Cash.Out.Header.DeleteProtect]
GO
