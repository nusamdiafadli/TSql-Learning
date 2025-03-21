/****** Object:  Table [Accounting].[General.Header]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[General.Header](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doctype_id] [tinyint] NOT NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NOT NULL,
	[doc_extern] [dbo].[Description.Short] NOT NULL,
	[doc_date] [date] NOT NULL,
	[doc_type] [tinyint] NOT NULL,
	[doc_remark] [dbo].[Description.Max] NULL,
	[docflow_seq] [tinyint] NOT NULL,
	[dept_id] [int] NOT NULL,
 CONSTRAINT [PK_General.Header] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Accounting].[General.Header] ADD  CONSTRAINT [DF_General.Header_doctype_id]  DEFAULT ((9)) FOR [doctype_id]
GO
ALTER TABLE [Accounting].[General.Header] ADD  CONSTRAINT [DF_General.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Accounting].[General.Header] ADD  CONSTRAINT [DF_General.Header_doc_date]  DEFAULT ([dbo].[getlocaldate]()) FOR [doc_date]
GO
ALTER TABLE [Accounting].[General.Header] ADD  CONSTRAINT [DF_General.Header_doc_type]  DEFAULT ((1)) FOR [doc_type]
GO
ALTER TABLE [Accounting].[General.Header] ADD  CONSTRAINT [DF_General.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
ALTER TABLE [Accounting].[General.Header] ADD  CONSTRAINT [DF_General.Header_dept_id]  DEFAULT ((0)) FOR [dept_id]
GO
/****** Object:  Trigger [Accounting].[General.Header.DeleteProtect]    Script Date: 11/8/2024 10:27:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			CREATE TRIGGER [Accounting].[General.Header.DeleteProtect]
			   ON [Accounting].[General.Header]
			   Instead of DELETE
			AS 
			BEGIN
				SET NOCOUNT ON;
				delete from Accounting.[General.Header] where doc_id in (select doc_id from deleted where docflow_seq=0)
			END
GO
ALTER TABLE [Accounting].[General.Header] ENABLE TRIGGER [General.Header.DeleteProtect]
GO
