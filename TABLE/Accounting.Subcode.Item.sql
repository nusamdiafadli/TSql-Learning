/****** Object:  Table [Accounting].[Subcode.Item]    Script Date: 11/8/2024 10:24:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Subcode.Item](
	[subcode_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[gl_subcode] [varchar](50) NULL,
	[subcode_desc] [dbo].[Description.Medium] NULL,
	[cc_id] [dbo].[Key.CC] NULL,
	[loc_id] [tinyint] NULL,
	[loc_linkid] [int] NULL,
 CONSTRAINT [PK_Subcode.Item] PRIMARY KEY CLUSTERED 
(
	[subcode_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Subcode.Item] ADD  CONSTRAINT [DF_Subcode.Item_group_id]  DEFAULT ((1)) FOR [group_id]
GO
ALTER TABLE [Accounting].[Subcode.Item]  WITH CHECK ADD  CONSTRAINT [FK_Subcode.Item_Subcode.Group] FOREIGN KEY([group_id])
REFERENCES [Accounting].[Subcode.Group] ([group_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Accounting].[Subcode.Item] CHECK CONSTRAINT [FK_Subcode.Item_Subcode.Group]
GO
