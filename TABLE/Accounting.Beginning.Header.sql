/****** Object:  Table [Accounting].[Beginning.Header]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Beginning.Header](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doctype_id] [tinyint] NOT NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[doc_date] [date] NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NOT NULL,
	[doc_name] [dbo].[Description.Medium] NOT NULL,
	[doc_remark] [dbo].[Description.Max] NULL,
	[docflow_seq] [tinyint] NOT NULL,
 CONSTRAINT [PK_Beginning.Header] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Beginning.Header] ADD  CONSTRAINT [DF_Beginning.Header_doctype_id]  DEFAULT ((1)) FOR [doctype_id]
GO
ALTER TABLE [Accounting].[Beginning.Header] ADD  CONSTRAINT [DF_Beginning.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Accounting].[Beginning.Header] ADD  CONSTRAINT [DF_Beginning.Header_doc_date]  DEFAULT ([dbo].[getlocaldate]()) FOR [doc_date]
GO
ALTER TABLE [Accounting].[Beginning.Header] ADD  CONSTRAINT [DF_Beginning.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
/****** Object:  Trigger [Accounting].[Beginning.Header.DeleteProtect]    Script Date: 11/8/2024 10:24:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Accounting].[Beginning.Header.DeleteProtect]
			   ON [Accounting].[Beginning.Header]
			   Instead of DELETE
			AS 
			BEGIN
				SET NOCOUNT ON;
				delete from Accounting.[Beginning.Header] where doc_id in (select doc_id from deleted where docflow_seq=0)
			END
GO
ALTER TABLE [Accounting].[Beginning.Header] ENABLE TRIGGER [Beginning.Header.DeleteProtect]
GO
