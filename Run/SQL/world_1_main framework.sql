
/****** Object:  Table [dbo].[Character]    Script Date: 07/13/2011 15:25:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Character](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[Map] [tinyint] NOT NULL,
	[CharLevel] [tinyint] NOT NULL,
	[Job] [tinyint] NOT NULL,
	[Male] [bit] NOT NULL,
	[HP] [int] NOT NULL,
	[SP] [int] NOT NULL,
	[Exp] [bigint] NOT NULL,
	[Money] [bigint] NOT NULL,
	[Hair] [tinyint] NOT NULL,
	[HairColor] [tinyint] NOT NULL,
	[Face] [tinyint] NOT NULL,
	[XPos] [int] NOT NULL,
	[YPos] [int] NOT NULL,
	[StatPoints] [tinyint] NOT NULL,
	[StrStats] [tinyint] NOT NULL,
	[EndStats] [tinyint] NOT NULL,
	[DexStats] [tinyint] NOT NULL,
	[IntStats] [tinyint] NOT NULL,
	[SprStats] [tinyint] NOT NULL,
	[CurrentTitle] [int] NULL,
	[QuickBar] [varbinary](max) NULL,
	[QuickBarState] [varbinary](max) NULL,
	[Shortcuts] [varbinary](max) NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'7636' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Character', @level2type=N'COLUMN',@level2name=N'XPos'
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Slot]  DEFAULT ((0)) FOR [Slot]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Map]  DEFAULT ((0)) FOR [Map]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Level]  DEFAULT ((1)) FOR [CharLevel]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Job]  DEFAULT ((0)) FOR [Job]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Male]  DEFAULT ((0)) FOR [Male]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_HP]  DEFAULT ((50)) FOR [HP]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_SP]  DEFAULT ((50)) FOR [SP]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Exp]  DEFAULT ((0)) FOR [Exp]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Money]  DEFAULT ((5000)) FOR [Money]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Hair]  DEFAULT ((0)) FOR [Hair]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_HairColor]  DEFAULT ((0)) FOR [HairColor]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_Face]  DEFAULT ((0)) FOR [Face]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_XPos]  DEFAULT ((7636)) FOR [XPos]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_YPos]  DEFAULT ((4610)) FOR [YPos]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_StatPoints]  DEFAULT ((0)) FOR [StatPoints]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_StrStats]  DEFAULT ((0)) FOR [StrStats]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_EndStats]  DEFAULT ((0)) FOR [EndStats]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_DexStats]  DEFAULT ((0)) FOR [DexStats]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_IntStats]  DEFAULT ((0)) FOR [IntStats]
GO

ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_SprStats]  DEFAULT ((0)) FOR [SprStats]
GO



/****** Object:  Table [dbo].[Equip]    Script Date: 07/13/2011 15:25:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Equip](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Owner] [int] NOT NULL,
	[Slot] [smallint] NOT NULL,
	[EquipID] [int] NOT NULL,
	[Upgrades] [tinyint] NOT NULL,
	[IncStr] [tinyint] NOT NULL,
	[IncEnd] [tinyint] NOT NULL,
	[IncDex] [tinyint] NOT NULL,
	[IncInt] [tinyint] NOT NULL,
	[IncSpr] [tinyint] NOT NULL,
	[Expires] [date] NULL,
 CONSTRAINT [PK_Equip] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Equip]  WITH CHECK ADD  CONSTRAINT [FK_Equip_Character] FOREIGN KEY([Owner])
REFERENCES [dbo].[Character] ([ID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Equip] CHECK CONSTRAINT [FK_Equip_Character]
GO

ALTER TABLE [dbo].[Equip] ADD  CONSTRAINT [DF_Equip_Upgrades]  DEFAULT ((0)) FOR [Upgrades]
GO

ALTER TABLE [dbo].[Equip] ADD  CONSTRAINT [DF_Equip_IncStr]  DEFAULT ((0)) FOR [IncStr]
GO

ALTER TABLE [dbo].[Equip] ADD  CONSTRAINT [DF_Equip_IncEnd]  DEFAULT ((0)) FOR [IncEnd]
GO

ALTER TABLE [dbo].[Equip] ADD  CONSTRAINT [DF_Equip_IncDex]  DEFAULT ((0)) FOR [IncDex]
GO

ALTER TABLE [dbo].[Equip] ADD  CONSTRAINT [DF_Equip_IncInt]  DEFAULT ((0)) FOR [IncInt]
GO

ALTER TABLE [dbo].[Equip] ADD  CONSTRAINT [DF_Equip_IncSpr]  DEFAULT ((0)) FOR [IncSpr]
GO




