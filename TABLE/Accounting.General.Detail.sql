/****** Object:  Table [Accounting].[General.Detail]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[General.Detail](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_idx] [smallint] NOT NULL,
	[acc_no] [Accounting].[COA] NULL,
	[gl_subcode] [dbo].[Remark.Short] NULL,
	[trans_currency] [dbo].[Currency.Code] NOT NULL,
	[trans_currate] [money] NOT NULL,
	[trans_remark] [dbo].[Description.Medium] NOT NULL,
	[trans_value] [money] NOT NULL,
	[trans_debit]  AS (case when [trans_value]*[trans_currate]>(0) then [trans_value]*[trans_currate] else (0) end),
	[trans_credit]  AS (case when [trans_value]*[trans_currate]<(0) then  -([trans_value]*[trans_currate]) else (0) end),
	[book_version] [tinyint] NOT NULL,
	[book_value]  AS (round([trans_value]*[trans_currate],(2))),
	[dept_id] [int] NOT NULL,
	[subcode_desc] [dbo].[Description.Medium] NULL,
 CONSTRAINT [PK_Account.General] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[General.Detail] ADD  CONSTRAINT [DF_Account.General_acc_currency]  DEFAULT ('IDR') FOR [trans_currency]
GO
ALTER TABLE [Accounting].[General.Detail] ADD  CONSTRAINT [DF_General.Detail_trans_currate]  DEFAULT ((1)) FOR [trans_currate]
GO
ALTER TABLE [Accounting].[General.Detail] ADD  CONSTRAINT [DF_Account.General_bb_value]  DEFAULT ((0)) FOR [trans_value]
GO
ALTER TABLE [Accounting].[General.Detail] ADD  CONSTRAINT [DF_General.Detail_book_version]  DEFAULT ((1)) FOR [book_version]
GO
ALTER TABLE [Accounting].[General.Detail] ADD  CONSTRAINT [DF_General.Detail_dept_id]  DEFAULT ((0)) FOR [dept_id]
GO
ALTER TABLE [Accounting].[General.Detail]  WITH CHECK ADD  CONSTRAINT [FK_General.Detail_General.Header] FOREIGN KEY([doc_id])
REFERENCES [Accounting].[General.Header] ([doc_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounting].[General.Detail] CHECK CONSTRAINT [FK_General.Detail_General.Header]
GO
