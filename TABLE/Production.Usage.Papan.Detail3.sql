/****** Object:  Table [Production].[Usage.Papan.Detail3]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Usage.Papan.Detail3](
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
	[trans_volume]  AS ((([trans_length]*[trans_width])*[trans_thick])/(1000000000)),
	[article_id] [int] NOT NULL,
	[journal_transid] [int] NULL,
	[trans_volumeresult] [numeric](18, 6) NULL,
 CONSTRAINT [PK_Usage.Papan.Detail3] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_trans_qty]  DEFAULT ((0)) FOR [trans_qty]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_trans_cogs]  DEFAULT ((0)) FOR [trans_cogs]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_trans_length]  DEFAULT ((0)) FOR [trans_length]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_trans_thick]  DEFAULT ((0)) FOR [trans_thick]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_trans_width]  DEFAULT ((0)) FOR [trans_width]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_article_id]  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] ADD  CONSTRAINT [DF_Usage.Papan.Detail3_trans_volumeresult]  DEFAULT ((0)) FOR [trans_volumeresult]
GO
ALTER TABLE [Production].[Usage.Papan.Detail3]  WITH CHECK ADD  CONSTRAINT [FK_Usage.Papan.Detail3_Usage.Papan.Header] FOREIGN KEY([doc_id])
REFERENCES [Production].[Usage.Papan.Header] ([doc_id])
ON DELETE CASCADE
GO
ALTER TABLE [Production].[Usage.Papan.Detail3] CHECK CONSTRAINT [FK_Usage.Papan.Detail3_Usage.Papan.Header]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Usage.Papan.Detail3', @level2type=N'COLUMN',@level2name=N'trans_volume'
GO
