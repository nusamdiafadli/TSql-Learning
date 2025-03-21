/****** Object:  Table [Production].[SPK.Detail]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[SPK.Detail](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_idx] [smallint] NOT NULL,
	[article_id] [int] NULL,
	[trans_qty] [numeric](18, 4) NOT NULL,
	[trans_remark] [dbo].[Description.Short] NULL,
	[order_id] [int] NOT NULL,
	[order_no] [dbo].[Key.Doc_No] NOT NULL,
	[usage_qty] [numeric](18, 4) NOT NULL,
 CONSTRAINT [PK_SPK.Detail] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[SPK.Detail] ADD  CONSTRAINT [DF_SPK.Detail_trans_qty]  DEFAULT ((0)) FOR [trans_qty]
GO
ALTER TABLE [Production].[SPK.Detail] ADD  CONSTRAINT [DF_SPK.Detail_usage_qty]  DEFAULT ((0)) FOR [usage_qty]
GO
ALTER TABLE [Production].[SPK.Detail]  WITH CHECK ADD  CONSTRAINT [FK_SPK.Detail_SPK.Detail] FOREIGN KEY([doc_id])
REFERENCES [Production].[SPK.Header] ([doc_id])
ON DELETE CASCADE
GO
ALTER TABLE [Production].[SPK.Detail] CHECK CONSTRAINT [FK_SPK.Detail_SPK.Detail]
GO
