/****** Object:  Table [Accounting].[COA]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[COA](
	[acc_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_no] [Accounting].[COA] NOT NULL,
	[acc_bank] [nvarchar](50) NULL,
	[acc_name] [dbo].[Description.Medium] NULL,
	[acc_journal] [bit] NULL,
	[acc_pl] [bit] NULL,
	[acc_bs] [bit] NULL,
	[acc_exclusive] [bit] NULL,
	[acc_currency] [dbo].[Currency.Code] NULL,
	[acc_group] [tinyint] NOT NULL,
	[subcode_group] [int] NULL,
	[acc_remark] [dbo].[Description.Medium] NULL,
	[acc_level] [dbo].[Description.Long] NULL,
	[acc_nature] [tinyint] NOT NULL,
	[acc_cf] [tinyint] NOT NULL,
	[acc_cfnature] [tinyint] NOT NULL,
	[acc_enable] [bit] NOT NULL,
	[book_version] [tinyint] NULL,
	[sys_user] [dbo].[System.User] NULL,
	[sys_time] [dbo].[System.Time] NULL,
	[timestamp] [timestamp] NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[acc_nonew] [Accounting].[COA] NULL,
	[dept_id] [int] NULL,
 CONSTRAINT [PK_COA] PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_COA] UNIQUE NONCLUSTERED 
(
	[acc_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_acc_group]  DEFAULT ((0)) FOR [acc_group]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_acc_nature]  DEFAULT ((1)) FOR [acc_nature]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_acc_cf]  DEFAULT ((1)) FOR [acc_cf]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_acc_cfnature]  DEFAULT ((1)) FOR [acc_cfnature]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_acc_enable]  DEFAULT ((1)) FOR [acc_enable]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_sys_time]  DEFAULT ([dbo].[getlocaldate]()) FOR [sys_time]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF__COA__cc_id__086B34A6]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Accounting].[COA] ADD  CONSTRAINT [DF_COA_dept_id]  DEFAULT ((0)) FOR [dept_id]
GO
/****** Object:  Trigger [Accounting].[COA.DeleteProtect]    Script Date: 11/8/2024 10:25:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Accounting].[COA.DeleteProtect]
	ON [Accounting].[COA]
	Instead of DELETE
AS 
BEGIN
	SET NOCOUNT ON;
END
GO
ALTER TABLE [Accounting].[COA] ENABLE TRIGGER [COA.DeleteProtect]
GO
/****** Object:  Trigger [Accounting].[COA_UpdateChild]    Script Date: 11/8/2024 10:26:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Accounting].[COA_UpdateChild] 
   ON  [Accounting].[COA]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

update b
	set b.acc_pl=a.acc_pl,
		b.acc_bs=a.acc_bs,
		b.acc_group=a.acc_group,
		b.acc_nature=a.acc_nature,
		b.acc_cf=a.acc_cf,
		b.acc_cfnature=a.acc_cfnature 
from inserted a inner join Accounting.COA b on b.acc_no like rtrim(a.acc_no)+'%' and b.acc_no<>a.acc_no
where a.acc_journal=0

END
GO
ALTER TABLE [Accounting].[COA] DISABLE TRIGGER [COA_UpdateChild]
GO
