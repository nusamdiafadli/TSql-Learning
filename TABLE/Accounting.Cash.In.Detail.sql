/****** Object:  Table [Accounting].[Cash.In.Detail]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Cash.In.Detail](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_idx] [int] NOT NULL,
	[acc_no] [Accounting].[COA] NULL,
	[gl_subcode] [varchar](50) NOT NULL,
	[trans_remark] [dbo].[Description.Medium] NOT NULL,
	[trans_value] [money] NOT NULL,
	[trans_payment] [bit] NOT NULL,
	[trans_matchid] [int] NULL,
	[trans_currency] [dbo].[Currency.Code] NOT NULL,
	[trans_currate] [money] NOT NULL,
	[trans_payvalue]  AS ([trans_value]*[trans_currate]),
	[dept_id] [int] NOT NULL,
	[subcode_desc] [dbo].[Description.Medium] NULL,
 CONSTRAINT [PK_Cash.In.Detail] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Cash.In.Detail] ADD  CONSTRAINT [DF_Cash.In.Detail_gl_subcode]  DEFAULT ('') FOR [gl_subcode]
GO
ALTER TABLE [Accounting].[Cash.In.Detail] ADD  CONSTRAINT [DF_Cash.In.Detail_trans_value]  DEFAULT ((0)) FOR [trans_value]
GO
ALTER TABLE [Accounting].[Cash.In.Detail] ADD  CONSTRAINT [DF_Cash.In.Detail_trans_payment]  DEFAULT ((0)) FOR [trans_payment]
GO
ALTER TABLE [Accounting].[Cash.In.Detail] ADD  CONSTRAINT [DF_Cash.In.Detail_trans_currency]  DEFAULT ([Accounting].[DefaultCurrency]()) FOR [trans_currency]
GO
ALTER TABLE [Accounting].[Cash.In.Detail] ADD  CONSTRAINT [DF_Cash.In.Detail_trans_currate]  DEFAULT ((1)) FOR [trans_currate]
GO
ALTER TABLE [Accounting].[Cash.In.Detail] ADD  CONSTRAINT [DF_Cash.In.Detail_dept_id]  DEFAULT ((0)) FOR [dept_id]
GO
ALTER TABLE [Accounting].[Cash.In.Detail]  WITH CHECK ADD  CONSTRAINT [FK_Cash.In.Detail_Cash.In.Header] FOREIGN KEY([doc_id])
REFERENCES [Accounting].[Cash.In.Header] ([doc_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounting].[Cash.In.Detail] CHECK CONSTRAINT [FK_Cash.In.Detail_Cash.In.Header]
GO
