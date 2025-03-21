/****** Object:  Table [Production].[Usage.Papan.Detail4]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Usage.Papan.Detail4](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[trans_idx] [int] NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_remark] [dbo].[Description.Max] NULL,
	[trans_qty] [numeric](18, 6) NOT NULL,
	[trans_cogs] [money] NOT NULL,
	[trans_papanno] [dbo].[Description.Short] NOT NULL,
	[trans_length] [numeric](18, 4) NOT NULL,
	[trans_thick] [numeric](18, 4) NOT NULL,
	[trans_width] [numeric](18, 4) NOT NULL,
	[trans_volume] [numeric](18, 6) NOT NULL,
	[article_id] [int] NULL,
	[journal_transid] [int] NULL,
	[trans_volumeresult] [numeric](18, 6) NULL,
	[kom_idx1] [int] NOT NULL,
	[kom_idx2] [int] NOT NULL,
	[kom_idx3] [int] NOT NULL,
	[kom_idx4] [int] NOT NULL,
	[total_rendemen] [numeric](18, 6) NOT NULL,
	[trans_dwidth] [numeric](18, 6) NULL,
	[trans_palletno] [nvarchar](100) NULL,
	[trans_weight] [numeric](10, 2) NULL,
	[journal_id] [int] NULL,
 CONSTRAINT [PK_Usage.Papan.Detail4] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_qty]  DEFAULT ((0)) FOR [trans_qty]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_cogs]  DEFAULT ((0)) FOR [trans_cogs]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_length]  DEFAULT ((0)) FOR [trans_length]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_thick]  DEFAULT ((0)) FOR [trans_thick]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_width]  DEFAULT ((0)) FOR [trans_width]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_volume]  DEFAULT ((0)) FOR [trans_volume]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_article_id]  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_volumeresult]  DEFAULT ((0)) FOR [trans_volumeresult]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_kom_idx1]  DEFAULT ((0)) FOR [kom_idx1]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_kom_idx2]  DEFAULT ((0)) FOR [kom_idx2]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_kom_idx3]  DEFAULT ((0)) FOR [kom_idx3]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_kom_idx4]  DEFAULT ((0)) FOR [kom_idx4]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_total_rendemen]  DEFAULT ((0)) FOR [total_rendemen]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] ADD  CONSTRAINT [DF_Usage.Papan.Detail4_trans_dwidth]  DEFAULT ((0)) FOR [trans_dwidth]
GO
ALTER TABLE [Production].[Usage.Papan.Detail4]  WITH CHECK ADD  CONSTRAINT [FK_Usage.Papan.Detail4_Usage.Papan.Header] FOREIGN KEY([doc_id])
REFERENCES [Production].[Usage.Papan.Header] ([doc_id])
ON DELETE CASCADE
GO
ALTER TABLE [Production].[Usage.Papan.Detail4] CHECK CONSTRAINT [FK_Usage.Papan.Detail4_Usage.Papan.Header]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Usage.Papan.Detail4', @level2type=N'COLUMN',@level2name=N'trans_volume'
GO
