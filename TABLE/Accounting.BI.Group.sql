/****** Object:  Table [Accounting].[BI.Group]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[BI.Group](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [nvarchar](50) NOT NULL,
	[group_idx] [int] NOT NULL,
	[group_line] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_BI.Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[BI.Group] ADD  CONSTRAINT [DF_BI.Group_group_line]  DEFAULT ((1)) FOR [group_line]
GO
