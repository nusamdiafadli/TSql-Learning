/****** Object:  Table [Production].[Article.Master.Komponen]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Article.Master.Komponen](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[trans_idx] [tinyint] NOT NULL,
	[article_id] [int] NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_totalvol]  AS ([trans_qty]*[trans_volume]),
	[trans_qty] [numeric](18, 5) NOT NULL,
	[trans_remark] [dbo].[Description.Max] NULL,
	[trans_price] [money] NOT NULL,
	[trans_total]  AS ([trans_qty]*[trans_price]),
	[trans_length] [numeric](18, 5) NOT NULL,
	[trans_width] [numeric](18, 5) NOT NULL,
	[trans_thick] [numeric](18, 5) NOT NULL,
	[trans_volume] [numeric](18, 5) NOT NULL,
	[trans_flag] [bit] NOT NULL,
	[trans_120] [bit] NULL,
	[trans_130] [bit] NULL,
	[trans_140] [bit] NULL,
	[trans_150] [bit] NULL,
	[trans_160] [bit] NULL,
	[trans_210] [bit] NULL,
	[trans_220] [bit] NULL,
	[trans_230] [bit] NULL,
	[trans_240] [bit] NULL,
	[trans_250] [bit] NULL,
	[type_id] [int] NULL,
	[article_idveener] [int] NOT NULL,
	[trans_dlength] [numeric](18, 5) NOT NULL,
	[trans_dwidth] [numeric](18, 5) NOT NULL,
	[trans_dthick] [numeric](18, 5) NOT NULL,
	[trans_dvolume] [numeric](18, 5) NOT NULL,
	[trans_luas] [numeric](18, 5) NOT NULL,
	[trans_lembar] [numeric](18, 5) NULL,
	[total_borong] [money] NULL,
 CONSTRAINT [PK_Article.Master.Wood] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Wood_trans_price]  DEFAULT ((0)) FOR [trans_price]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_length]  DEFAULT ((0)) FOR [trans_length]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_width]  DEFAULT ((0)) FOR [trans_width]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_thick]  DEFAULT ((0)) FOR [trans_thick]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_volume]  DEFAULT ((0)) FOR [trans_volume]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_flag]  DEFAULT ((0)) FOR [trans_flag]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_120]  DEFAULT ((0)) FOR [trans_120]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_130]  DEFAULT ((0)) FOR [trans_130]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_140]  DEFAULT ((0)) FOR [trans_140]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_150]  DEFAULT ((0)) FOR [trans_150]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_160]  DEFAULT ((0)) FOR [trans_160]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_210]  DEFAULT ((0)) FOR [trans_210]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_220]  DEFAULT ((0)) FOR [trans_220]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_230]  DEFAULT ((0)) FOR [trans_230]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_240]  DEFAULT ((0)) FOR [trans_240]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_250]  DEFAULT ((0)) FOR [trans_250]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_article_idbahan]  DEFAULT ((0)) FOR [type_id]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_item_idbahan]  DEFAULT ((0)) FOR [article_idveener]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_dlength]  DEFAULT ((0)) FOR [trans_dlength]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_dwidth]  DEFAULT ((0)) FOR [trans_dwidth]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_dthick]  DEFAULT ((0)) FOR [trans_dthick]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_dvolume]  DEFAULT ((0)) FOR [trans_dvolume]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DF_Article.Master.Komponen_trans_luas]  DEFAULT ((0)) FOR [trans_luas]
GO
ALTER TABLE [Production].[Article.Master.Komponen] ADD  CONSTRAINT [DEFAULT_Article.Master.Komponen_total_borong]  DEFAULT ((0)) FOR [total_borong]
GO
