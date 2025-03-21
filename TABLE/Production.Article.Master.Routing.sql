/****** Object:  Table [Production].[Article.Master.Routing]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Article.Master.Routing](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[trans_idx] [tinyint] NOT NULL,
	[doc_id] [int] NOT NULL,
	[dept_idfrom] [int] NOT NULL,
	[article_id]  AS ([doc_id]),
	[trans_urutan] [int] NOT NULL,
	[routing_id] [int] NOT NULL,
	[trans_jmlprocess] [int] NOT NULL,
	[trans_totalprocess] [int] NOT NULL,
	[trans_mesin] [int] NOT NULL,
	[trans_menpower] [int] NOT NULL,
	[trans_waittime] [nvarchar](50) NOT NULL,
	[dept_idto] [int] NULL,
	[brorong_price] [money] NULL,
 CONSTRAINT [PK_Article.Master.Routing] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Routing_trans_idx]  DEFAULT ((0)) FOR [trans_idx]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Komponen.Routing_dept_id]  DEFAULT ((0)) FOR [dept_idfrom]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Komponen.Routing_trans_urutan]  DEFAULT ((0)) FOR [trans_urutan]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Komponen.Routing_routing_id]  DEFAULT ((0)) FOR [routing_id]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Routing_trans_jmlprocess]  DEFAULT ((0)) FOR [trans_jmlprocess]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Routing_trans_totalprocess]  DEFAULT ((0)) FOR [trans_totalprocess]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Routing_trans_mesin]  DEFAULT ((0)) FOR [trans_mesin]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Routing_trans_menpower]  DEFAULT ((0)) FOR [trans_menpower]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DF_Article.Master.Routing_dept_idto]  DEFAULT ((0)) FOR [dept_idto]
GO
ALTER TABLE [Production].[Article.Master.Routing] ADD  CONSTRAINT [DEFAULT_Article.Master.Routing_brorong_price]  DEFAULT ((0)) FOR [brorong_price]
GO
