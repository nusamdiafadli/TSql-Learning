/****** Object:  Table [Inventory].[Warehouse.Location]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[Warehouse.Location](
	[location_id] [int] IDENTITY(1,1) NOT NULL,
	[ware_id] [tinyint] NOT NULL,
	[location_name] [dbo].[Description.Medium] NOT NULL,
	[trans_idx] [tinyint] NOT NULL,
 CONSTRAINT [PK_Warehouse.Location] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Inventory].[Warehouse.Location]  WITH CHECK ADD  CONSTRAINT [FK_Warehouse.Location_Warehouse.Location] FOREIGN KEY([ware_id])
REFERENCES [Inventory].[Warehouse] ([ware_id])
ON DELETE CASCADE
GO
ALTER TABLE [Inventory].[Warehouse.Location] CHECK CONSTRAINT [FK_Warehouse.Location_Warehouse.Location]
GO
