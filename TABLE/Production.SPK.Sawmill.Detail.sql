/****** Object:  Table [Production].[SPK.Sawmill.Detail]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[SPK.Sawmill.Detail](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_idx] [smallint] NOT NULL,
	[article_id] [int] NULL,
	[trans_qty] [numeric](18, 4) NULL,
	[trans_remark] [dbo].[Description.Medium] NULL,
	[so_id] [int] NULL,
	[so_no] [nvarchar](50) NULL,
	[trans_volume] [numeric](18, 6) NOT NULL,
	[trans_length] [numeric](18, 4) NOT NULL,
	[trans_width] [numeric](18, 4) NOT NULL,
	[trans_thick] [numeric](18, 4) NOT NULL,
	[so_docid] [int] NULL,
	[article_idparent] [int] NULL,
 CONSTRAINT [PK_SPK.Sawmill.Detail] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail] ADD  CONSTRAINT [DF_SPK.Sawmill.Detail_trans_qty]  DEFAULT ((0)) FOR [trans_qty]
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail] ADD  CONSTRAINT [DF_SPK.Sawmill.Detail_trans_volume]  DEFAULT ((0)) FOR [trans_volume]
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail] ADD  CONSTRAINT [DF_SPK.Sawmill.Detail_trans_length]  DEFAULT ((0)) FOR [trans_length]
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail] ADD  CONSTRAINT [DF_SPK.Sawmill.Detail_trans_width]  DEFAULT ((0)) FOR [trans_width]
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail] ADD  CONSTRAINT [DF_SPK.Sawmill.Detail_trans_thick]  DEFAULT ((0)) FOR [trans_thick]
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail]  WITH CHECK ADD  CONSTRAINT [FK_SPK.Sawmill.Detail_SPK.Sawmill.Header] FOREIGN KEY([doc_id])
REFERENCES [Production].[SPK.Sawmill.Header] ([doc_id])
ON DELETE CASCADE
GO
ALTER TABLE [Production].[SPK.Sawmill.Detail] CHECK CONSTRAINT [FK_SPK.Sawmill.Detail_SPK.Sawmill.Header]
GO
