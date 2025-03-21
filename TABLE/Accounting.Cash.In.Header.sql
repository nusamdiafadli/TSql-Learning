/****** Object:  Table [Accounting].[Cash.In.Header]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Cash.In.Header](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NULL,
	[doctype_id] [tinyint] NOT NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[docflow_seq] [tinyint] NOT NULL,
	[doc_extern] [dbo].[Description.Short] NOT NULL,
	[doc_date] [date] NOT NULL,
	[acc_no] [Accounting].[COA] NULL,
	[doc_currency] [dbo].[Currency.Code] NOT NULL,
	[gl_subcode] [varchar](50) NOT NULL,
	[cheque_no] [dbo].[Description.Short] NULL,
	[cashing_date] [date] NULL,
	[cashed_date] [date] NULL,
	[doc_cashier] [dbo].[Description.Short] NULL,
	[doc_depositor] [dbo].[Description.Short] NULL,
	[doc_remark] [dbo].[Description.Long] NULL,
	[doc_artotal] [money] NOT NULL,
	[doc_transtotal] [money] NOT NULL,
	[doc_total]  AS ([doc_transtotal]+[doc_artotal]),
	[cust_id] [int] NULL,
	[doc_currate] [money] NULL,
	[doc_reconcile] [bit] NOT NULL,
	[doc_desc]  AS (('CI '+[doc_no])+case when [doc_extern]<>'' then (' ('+rtrim([doc_extern]))+')' else '' end),
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_Cash.In.Header] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_doc_type]  DEFAULT ((2)) FOR [doctype_id]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_gl_subcode]  DEFAULT ('') FOR [gl_subcode]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_doc_artotal]  DEFAULT ((0)) FOR [doc_artotal]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_doc_transtotal]  DEFAULT ((0)) FOR [doc_transtotal]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF__Cash.In.H__doc_c__4EA972BC]  DEFAULT ((1)) FOR [doc_currate]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF__Cash.In.H__doc_r__3573B09E]  DEFAULT ((0)) FOR [doc_reconcile]
GO
ALTER TABLE [Accounting].[Cash.In.Header] ADD  CONSTRAINT [DF_Cash.In.Header_dept_id]  DEFAULT ((0)) FOR [dept_id]
GO
ALTER TABLE [Accounting].[Cash.In.Header]  WITH CHECK ADD  CONSTRAINT [FK_Cash.In.Header_Customer.Master] FOREIGN KEY([cust_id])
REFERENCES [Sales].[Customer.Master] ([cust_ID])
GO
ALTER TABLE [Accounting].[Cash.In.Header] CHECK CONSTRAINT [FK_Cash.In.Header_Customer.Master]
GO
/****** Object:  Trigger [Accounting].[Cash.In.Header.DeleteProtect]    Script Date: 11/8/2024 10:24:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Accounting].[Cash.In.Header.DeleteProtect]
			   ON [Accounting].[Cash.In.Header]
			   Instead of DELETE
			AS 
			BEGIN
				SET NOCOUNT ON;
				delete from Accounting.[Cash.In.Header] where doc_id in (select doc_id from deleted where docflow_seq=1)
			END
GO
ALTER TABLE [Accounting].[Cash.In.Header] ENABLE TRIGGER [Cash.In.Header.DeleteProtect]
GO
