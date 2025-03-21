/****** Object:  Table [Accounting].[BI.Report]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[BI.Report](
	[trans_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NULL,
	[trans_value] [money] NOT NULL,
	[trans_period] [int] NULL,
	[cc_id] [tinyint] NOT NULL,
	[acc_no] [nvarchar](10) NULL,
 CONSTRAINT [PK_BI.Report] PRIMARY KEY CLUSTERED 
(
	[trans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[BI.Report] ADD  CONSTRAINT [DF_BI.Report_trans_value]  DEFAULT ((0)) FOR [trans_value]
GO
ALTER TABLE [Accounting].[BI.Report] ADD  CONSTRAINT [DF_BI.Report_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
