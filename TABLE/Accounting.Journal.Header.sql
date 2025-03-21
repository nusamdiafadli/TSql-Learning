/****** Object:  Table [Accounting].[Journal.Header]    Script Date: 11/8/2024 10:24:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Accounting].[Journal.Header](
	[hdr_id] [int] IDENTITY(1,1) NOT NULL,
	[doctype_id] [tinyint] NOT NULL,
	[cc_id] [dbo].[Key.CC] NOT NULL,
	[doc_no] [dbo].[Key.Doc_No] NOT NULL,
	[docflow_seq] [tinyint] NOT NULL,
	[doc_revision] [tinyint] NOT NULL,
	[gl_no] [dbo].[Description.Short] NOT NULL,
	[gl_extern] [dbo].[Description.Short] NULL,
	[gl_date] [date] NULL,
	[gl_duedate] [date] NULL,
	[gl_currency] [dbo].[Currency.Code] NULL,
	[gl_currate] [smallmoney] NULL,
	[gl_checked] [bit] NOT NULL,
	[gl_type] [dbo].[Description.Short] NULL,
	[book_version] [dbo].[System.BookVersion] NULL,
	[gl_posttime] [datetime] NULL,
	[timestamp] [timestamp] NULL,
	[gl_period]  AS (CONVERT([smallint],isnull(datepart(year,[gl_date])*(12)+datepart(month,[gl_date]),(0)),(0))) PERSISTED,
	[doc_id] [int] NULL,
	[created_date] [date] NULL,
 CONSTRAINT [PK_Journal.Header] PRIMARY KEY CLUSTERED 
(
	[hdr_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Accounting].[Journal.Header] ADD  CONSTRAINT [DF_Journal.Header_doctype_id]  DEFAULT ((1)) FOR [doctype_id]
GO
ALTER TABLE [Accounting].[Journal.Header] ADD  CONSTRAINT [DF_Journal.Header_cc_id]  DEFAULT ((1)) FOR [cc_id]
GO
ALTER TABLE [Accounting].[Journal.Header] ADD  CONSTRAINT [DF_Journal.Header_docflow_seq]  DEFAULT ((0)) FOR [docflow_seq]
GO
ALTER TABLE [Accounting].[Journal.Header] ADD  CONSTRAINT [DF_Journal.Header_doc_revision]  DEFAULT ((0)) FOR [doc_revision]
GO
ALTER TABLE [Accounting].[Journal.Header] ADD  CONSTRAINT [DF_Journal.Header_gl_checked]  DEFAULT ((0)) FOR [gl_checked]
GO
ALTER TABLE [Accounting].[Journal.Header] ADD  DEFAULT ([dbo].[getlocaldate]()) FOR [created_date]
GO
/****** Object:  Trigger [Accounting].[Journal.Header.CascadeDelete]    Script Date: 11/8/2024 10:27:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [Accounting].[Journal.Header.CascadeDelete]
   ON  [Accounting].[Journal.Header] 
   Instead of delete
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    delete from Accounting.[Journal.Detail] where hdr_id in (select hdr_id from deleted) 

	delete from Accounting.[Journal.Header]
		where gl_checked=0 and hdr_id in (select hdr_id from deleted) 

END
GO
ALTER TABLE [Accounting].[Journal.Header] ENABLE TRIGGER [Journal.Header.CascadeDelete]
GO
/****** Object:  Trigger [Accounting].[Journal.SetGLNo]    Script Date: 11/8/2024 10:27:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [Accounting].[Journal.SetGLNo] ON [Accounting].[Journal.Header]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Insert statements for trigger here
    IF UPDATE (doc_no) OR UPDATE (doctype_id) OR UPDATE (docflow_seq) OR UPDATE (doc_revision)

    UPDATE Accounting.[Journal.Header]
        SET gl_no = CASE WHEN doctype_id IN (1, 2, 3, 10, 27, 23, 9, 33, 101 ) THEN TRIM(doc_no) 
                        ELSE (
                            SELECT trim(doctype_header)
                            FROM System.[Flow.Document] a
                            WHERE a.doctype_id = Accounting.[Journal.Header].doctype_id
                            ) + '-' + TRIM(doc_no) END
            -- +'-'+convert(varchar,docflow_seq)+'-'+convert(varchar,doc_revision)
    WHERE hdr_id IN ( SELECT hdr_id FROM inserted )
        -- AND doctype_id NOT IN (1, 2, 3, 10, 27, 23, 9, 33, 101 )
END
GO
ALTER TABLE [Accounting].[Journal.Header] ENABLE TRIGGER [Journal.SetGLNo]
GO
