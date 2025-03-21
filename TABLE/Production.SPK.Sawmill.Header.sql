/****** Object:  Table [Production].[SPK.Sawmill.Header]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[SPK.Sawmill.Header](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doctype_id] [tinyint] NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NOT NULL,
	[doc_extern] [dbo].[Description.Short] NOT NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[docflow_seq] [tinyint] NOT NULL,
	[doc_remark] [dbo].[Description.Max] NULL,
	[doc_date] [date] NOT NULL,
	[finish_date] [date] NULL,
	[so_doc_id] [int] NOT NULL,
	[doc_container] [nvarchar](20) NOT NULL,
	[dept_id] [nchar](10) NULL,
	[workstation_id] [int] NULL,
	[cust_id] [int] NULL,
 CONSTRAINT [PK_SPK.Sawmill.Header] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[SPK.Sawmill.Header] ADD  CONSTRAINT [DF_SPK.Sawmill.Header_doctype_id]  DEFAULT ((106)) FOR [doctype_id]
GO
ALTER TABLE [Production].[SPK.Sawmill.Header] ADD  CONSTRAINT [DF_SPK.Sawmill.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Production].[SPK.Sawmill.Header] ADD  CONSTRAINT [DF_SPK.Sawmill.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
ALTER TABLE [Production].[SPK.Sawmill.Header] ADD  CONSTRAINT [DF_SPK.Sawmill.Header_doc_date]  DEFAULT ([dbo].[getlocaldate]()) FOR [doc_date]
GO
ALTER TABLE [Production].[SPK.Sawmill.Header] ADD  CONSTRAINT [DF_SPK.Sawmill.Header_so_doc_id]  DEFAULT ((0)) FOR [so_doc_id]
GO
ALTER TABLE [Production].[SPK.Sawmill.Header] ADD  CONSTRAINT [DF_SPK.Sawmill.Header_article_id]  DEFAULT ((0)) FOR [cust_id]
GO
