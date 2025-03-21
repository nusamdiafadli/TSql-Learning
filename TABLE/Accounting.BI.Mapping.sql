/****** Object:  Table [Accounting].[BI.Mapping]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[BI.Mapping](
	[map_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_no] [Accounting].[COA] NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_BI.Mapping] PRIMARY KEY CLUSTERED 
(
	[map_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[BI.Mapping] ADD  CONSTRAINT [DF_BI.Mapping_group_id]  DEFAULT ((0)) FOR [group_id]
GO
