/****** Object:  Table [Production].[Usage.Papan.Detail]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Production].[Usage.Papan.Detail](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[trans_idx] [int] NOT NULL,
	[doc_id] [int] NOT NULL,
	[trans_remark] [dbo].[Description.Max] NULL,
	[trans_qty] [numeric](18, 6) NOT NULL,
	[trans_cogs] [money] NOT NULL,
	[trans_length] [numeric](18, 4) NOT NULL,
	[trans_thick] [numeric](18, 4) NOT NULL,
	[trans_width] [numeric](18, 4) NOT NULL,
	[trans_volume] [numeric](18, 6) NOT NULL,
	[article_id] [int] NOT NULL,
	[journal_transid] [int] NULL,
	[lotcard_no] [nvarchar](50) NOT NULL,
	[spk_idU] [int] NULL,
	[spk_idP] [int] NOT NULL,
	[lotcard_id] [int] NULL,
	[trans_idparent] [int] NULL,
	[laminasi_qty] [numeric](18, 2) NOT NULL,
	[target_qty] [numeric](18, 2) NOT NULL,
	[result_volume]  AS ([trans_volume]*[trans_result]),
	[trans_result] [numeric](18, 2) NOT NULL,
	[trans_palletno] [nvarchar](100) NULL,
	[trans_weight] [numeric](10, 2) NULL,
	[trans_flag] [bit] NULL,
 CONSTRAINT [PK_Usage.Papan.Detail] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_doc_id]  DEFAULT ((0)) FOR [doc_id]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_qty]  DEFAULT ((0)) FOR [trans_qty]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_cogs]  DEFAULT ((0)) FOR [trans_cogs]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_length]  DEFAULT ((0)) FOR [trans_length]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_thick]  DEFAULT ((0)) FOR [trans_thick]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_width]  DEFAULT ((0)) FOR [trans_width]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_volume]  DEFAULT ((0)) FOR [trans_volume]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_article_id]  DEFAULT ((0)) FOR [article_id]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_idspk]  DEFAULT ((0)) FOR [spk_idP]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_laminasi_qty]  DEFAULT ((1)) FOR [laminasi_qty]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_target_qty]  DEFAULT ((0)) FOR [target_qty]
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ADD  CONSTRAINT [DF_Usage.Papan.Detail_trans_result]  DEFAULT ((0)) FOR [trans_result]
GO
/****** Object:  Trigger [Production].[Usage.Papan.Detail_update]    Script Date: 11/8/2024 10:27:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE TRIGGER [Production].[Usage.Papan.Detail_update]
   ON  [Production].[Usage.Papan.Detail]
   AFTER INSERT,UPDATE
AS 
BEGIN

	SET NOCOUNT ON;
	update a set a.trans_result=b.trans_qty/(case when b.laminasi_qty=0 then 0 else b.laminasi_qty end)
	from [Production].[Usage.Papan.Detail] a 
	inner join inserted b On a.trans_id=b.trans_id


END
GO
ALTER TABLE [Production].[Usage.Papan.Detail] ENABLE TRIGGER [Usage.Papan.Detail_update]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Usage.Papan.Detail', @level2type=N'COLUMN',@level2name=N'trans_volume'
GO
