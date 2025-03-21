/****** Object:  Table [Accounting].[Subcode.Group]    Script Date: 11/8/2024 10:24:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Subcode.Group](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [dbo].[Description.Short] NOT NULL,
	[group_manual] [bit] NOT NULL,
 CONSTRAINT [PK_Subcode.Group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Subcode.Group] ADD  CONSTRAINT [DF_Subcode.Group_group_manual]  DEFAULT ((1)) FOR [group_manual]
GO
