/****** Object:  Table [Accounting].[Beginning.Detail]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Beginning.Detail](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_idx] [smallint] NOT NULL,
	[acc_no] [Accounting].[COA] NULL,
	[gl_subcode] [dbo].[Remark.Short] NULL,
	[trans_currency] [dbo].[Currency.Code] NOT NULL,
	[trans_currate] [money] NOT NULL,
	[trans_value] [money] NOT NULL,
	[trans_fvalue] [money] NOT NULL,
	[trans_debit]  AS (case when [trans_value]>(0) then [trans_value] else (0) end),
	[trans_credit]  AS (case when [trans_value]<(0) then  -[trans_value] else (0) end),
	[trans_fdebit]  AS (case when [trans_fvalue]>(0) then [trans_fvalue] else (0) end),
	[trans_fcredit]  AS (case when [trans_fvalue]<(0) then  -[trans_fvalue] else (0) end),
	[book_version] [tinyint] NOT NULL,
	[trans_remark] [dbo].[Description.Medium] NOT NULL,
 CONSTRAINT [PK_Account.Beginning] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Beginning.Detail] ADD  CONSTRAINT [DF_Account.Beginning_acc_currency]  DEFAULT ([Accounting].[DefaultCurrency]()) FOR [trans_currency]
GO
ALTER TABLE [Accounting].[Beginning.Detail] ADD  CONSTRAINT [DF_Beginning.Detail_trans_currate]  DEFAULT ((1)) FOR [trans_currate]
GO
ALTER TABLE [Accounting].[Beginning.Detail] ADD  CONSTRAINT [DF_Account.Beginning_bb_value]  DEFAULT ((0)) FOR [trans_value]
GO
ALTER TABLE [Accounting].[Beginning.Detail] ADD  CONSTRAINT [DF_Account.Beginning_bb_fvalue]  DEFAULT ((0)) FOR [trans_fvalue]
GO
ALTER TABLE [Accounting].[Beginning.Detail] ADD  CONSTRAINT [DF_Beginning.Detail_book_version]  DEFAULT ((1)) FOR [book_version]
GO
ALTER TABLE [Accounting].[Beginning.Detail]  WITH CHECK ADD  CONSTRAINT [FK_Beginning.Detail_Beginning.Header] FOREIGN KEY([doc_id])
REFERENCES [Accounting].[Beginning.Header] ([doc_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounting].[Beginning.Detail] CHECK CONSTRAINT [FK_Beginning.Detail_Beginning.Header]
GO
