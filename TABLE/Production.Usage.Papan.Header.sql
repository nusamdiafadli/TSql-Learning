/****** Object:  Table [Production].[Usage.Papan.Header]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Usage.Papan.Header](
	[doc_id] [int] IDENTITY(1,1) NOT NULL,
	[doctype_id] [tinyint] NOT NULL,
	[cc_id] [tinyint] NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NOT NULL,
	[doc_extern] [dbo].[Description.Short] NOT NULL,
	[docflow_seq] [tinyint] NOT NULL,
	[doc_date] [date] NOT NULL,
	[doc_remark] [dbo].[Description.Max] NULL,
	[doc_user] [dbo].[System.User] NOT NULL,
	[doc_totalvolresult] [numeric](18, 6) NOT NULL,
	[acc_no] [Accounting].[COA] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[type_id] [int] NOT NULL,
	[doc_randomen] [numeric](18, 6) NOT NULL,
	[doc_totalvolsct] [numeric](18, 6) NOT NULL,
	[doc_flag] [tinyint] NOT NULL,
	[doc_LPBB] [nvarchar](50) NOT NULL,
	[doc_totalvolpapan] [numeric](18, 6) NOT NULL,
	[doc_volsusut] [numeric](18, 6) NOT NULL,
	[spk_idU] [int] NULL,
	[mkb_id] [int] NULL,
	[article_alias] [varchar](50) NULL,
 CONSTRAINT [PK_Usage.Papan.Header] PRIMARY KEY CLUSTERED 
(
	[doc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doctype_id]  DEFAULT ((99)) FOR [doctype_id]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_date]  DEFAULT ([dbo].[getlocaldate]()) FOR [doc_date]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_totalvol]  DEFAULT ((0)) FOR [doc_totalvolresult]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_created_date]  DEFAULT ([dbo].[getlocaldate]()) FOR [created_date]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_type_id]  DEFAULT ((0)) FOR [type_id]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_randomen]  DEFAULT ((0)) FOR [doc_randomen]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_totalvolsct]  DEFAULT ((0)) FOR [doc_totalvolsct]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_flagtc]  DEFAULT ((30)) FOR [doc_flag]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_totalvolpapan]  DEFAULT ((0)) FOR [doc_totalvolpapan]
GO
ALTER TABLE [Production].[Usage.Papan.Header] ADD  CONSTRAINT [DF_Usage.Papan.Header_doc_volsusut]  DEFAULT ((0)) FOR [doc_volsusut]
GO
/****** Object:  Trigger [Production].[Usage.Papan.Header.DeleteProtect]    Script Date: 11/8/2024 10:27:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create TRIGGER [Production].[Usage.Papan.Header.DeleteProtect]
			   ON [Production].[Usage.Papan.Header]
			   Instead of DELETE
			AS 
			BEGIN
				SET NOCOUNT ON;
				delete from Production.[Usage.Papan.Header] where doc_id in (select doc_id from deleted where docflow_seq=0)
			END
GO
ALTER TABLE [Production].[Usage.Papan.Header] ENABLE TRIGGER [Usage.Papan.Header.DeleteProtect]
GO
