USE [Zepheus_Account]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07/10/2011 18:13:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](16) NOT NULL,
	[Password] [varchar](32) NOT NULL,
	[Admin] [tinyint] NOT NULL,
	[Email] [varchar](100) NULL,
	[Banned] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF_User_Admin]    Script Date: 07/10/2011 18:13:38 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Admin]  DEFAULT ((0)) FOR [Admin]
GO
/****** Object:  Default [DF_User_Banned]    Script Date: 07/10/2011 18:13:38 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Banned]  DEFAULT ((0)) FOR [Banned]
GO
