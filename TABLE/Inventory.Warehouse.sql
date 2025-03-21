/****** Object:  Table [Inventory].[Warehouse]    Script Date: 11/8/2024 10:24:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Inventory].[Warehouse](
	[ware_id] [tinyint] IDENTITY(1,1) NOT NULL,
	[ware_no]  AS (right('000'+CONVERT([nvarchar],[ware_id],(0)),(3))),
	[ware_name] [dbo].[Description.Short] NOT NULL,
	[ware_production] [bit] NOT NULL,
	[ware_address] [dbo].[Description.Long] NOT NULL,
	[cc_id] [dbo].[Key.CC] NULL,
	[ware_city] [dbo].[Description.Short] NOT NULL,
	[ware_desc]  AS (rtrim([ware_name])+case when [ware_city]<>'' then ' - '+rtrim([ware_city]) else '' end),
	[branch_id] [int] NOT NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ware_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Inventory].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_ware_production]  DEFAULT ((0)) FOR [ware_production]
GO
ALTER TABLE [Inventory].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Inventory].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_branch_id]  DEFAULT ((0)) FOR [branch_id]
GO
/****** Object:  Trigger [Inventory].[Warehouse.Cascade_SubCode]    Script Date: 11/8/2024 10:27:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Puji Hasana Wijaya
-- Create date: 9/4/2013
-- Description:	Cascade update Warehouse code to GL Subcode Item List
-- =============================================
CREATE TRIGGER [Inventory].[Warehouse.Cascade_SubCode]
   ON  [Inventory].[Warehouse]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

			--if update(ware_name) or update(ware_city)
			--	update [Inventory].[Warehouse] set
			--			ware_desc=rtrim(ware_name)+case when ware_city<>'' then ' - '+rtrim(ware_city) else '' end
			--			where ware_id in (select ware_id from inserted)
						
			-- Remarked because ware_name is a computed column


			declare @ID int
			
			select @ID=group_id from Accounting.[Subcode.Group] where group_name='Warehouse'

/* UPSERT into Accounting.[Subcode.Item]*/	
			if update(ware_id) or update(ware_name) or update(ware_city)
				begin
					
					MERGE Accounting.[Subcode.Item] as Target
					USING
					(select	
							a.cc_id as new_cc_id,
							a.ware_no as new_gl_subcode,
							a.ware_desc as new_subcode_desc,
							a.ware_id as new_loc_linkid,
							b.cc_id as old_cc_id,
							b.ware_no as old_gl_subcode,
							b.ware_desc as old_subcode_desc
						from inserted a full join deleted b on a.ware_id=b.ware_id) as Source
						on Target.loc_linkid=isnull(Source.new_loc_linkid,0) and Target.Group_ID=@ID
					WHEN MATCHED and Source.new_gl_subcode is null
						Then Delete
					WHEN MATCHED and Source.new_gl_subcode is not null
						Then Update
							set Target.gl_subcode=Source.new_gl_subcode,Target.Subcode_Desc=Source.new_subcode_desc,Target.cc_id=Source.new_cc_id
					when not matched by target
						Then insert values (@ID,new_gl_subcode,new_subcode_desc,new_cc_id,1,new_loc_linkid);
				end
END
GO
ALTER TABLE [Inventory].[Warehouse] ENABLE TRIGGER [Warehouse.Cascade_SubCode]
GO
/****** Object:  Trigger [Inventory].[Warehouse.DeleteProtect]    Script Date: 11/8/2024 10:27:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [Inventory].[Warehouse.DeleteProtect]
   ON  [Inventory].[Warehouse]
   instead of DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	delete from Inventory.Warehouse where ware_id in (select ware_id from deleted where ware_id>1)

END
GO
ALTER TABLE [Inventory].[Warehouse] ENABLE TRIGGER [Warehouse.DeleteProtect]
GO
