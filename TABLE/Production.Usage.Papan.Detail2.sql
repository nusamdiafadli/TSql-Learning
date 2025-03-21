/****** Object:  Table [Production].[Usage.Papan.Detail2]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Usage.Papan.Detail2](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NOT NULL,
	[article_id] [int] NOT NULL,
	[trans_length] [numeric](18, 6) NOT NULL,
	[trans_width] [numeric](18, 6) NOT NULL,
	[trans_thick] [numeric](18, 6) NOT NULL,
	[trans_volume] [numeric](18, 6) NOT NULL,
	[trans_idx] [tinyint] NOT NULL,
	[trans_qty] [numeric](18, 4) NOT NULL,
 CONSTRAINT [PK_Usage.Papan.Detail2] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] ADD  CONSTRAINT [DF_Usage.Papan.Detail2_trans_length]  DEFAULT ((0)) FOR [trans_length]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] ADD  CONSTRAINT [DF_Usage.Papan.Detail2_trans_width]  DEFAULT ((0)) FOR [trans_width]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] ADD  CONSTRAINT [DF_Usage.Papan.Detail2_trans_thick]  DEFAULT ((0)) FOR [trans_thick]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] ADD  CONSTRAINT [DF_Usage.Papan.Detail2_trans_volume]  DEFAULT ((0)) FOR [trans_volume]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] ADD  CONSTRAINT [DF_Usage.Papan.Detail2_trans_idx]  DEFAULT ((0)) FOR [trans_idx]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] ADD  CONSTRAINT [DF_Usage.Papan.Detail2_trans_qty]  DEFAULT ((0)) FOR [trans_qty]
GO
ALTER TABLE [Production].[Usage.Papan.Detail2]  WITH CHECK ADD  CONSTRAINT [FK_Usage.Papan.Detail2_Usage.Papan.Header] FOREIGN KEY([doc_id])
REFERENCES [Production].[Usage.Papan.Header] ([doc_id])
ON DELETE CASCADE
GO
ALTER TABLE [Production].[Usage.Papan.Detail2] CHECK CONSTRAINT [FK_Usage.Papan.Detail2_Usage.Papan.Header]
GO
