BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Slot
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Map
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Level
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Job
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Male
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_HP
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_SP
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Exp
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Money
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Hair
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_HairColor
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_Face
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_XPos
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_YPos
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_StatPoints
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_StrStats
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_EndStats
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_DexStats
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_IntStats
GO
ALTER TABLE dbo.Character
	DROP CONSTRAINT DF_Character_SprStats
GO
CREATE TABLE dbo.Tmp_Character
	(
	ID int NOT NULL IDENTITY (1, 1),
	AccountID int NOT NULL,
	Name varchar(20) NOT NULL,
	Slot tinyint NOT NULL,
	Map tinyint NOT NULL,
	CharLevel tinyint NOT NULL,
	Job tinyint NOT NULL,
	Male bit NOT NULL,
	HP int NOT NULL,
	SP int NOT NULL,
	HPStones smallint NOT NULL,
	SPStones smallint NOT NULL,
	Exp bigint NOT NULL,
	Fame int NOT NULL,
	Money bigint NOT NULL,
	Hair tinyint NOT NULL,
	HairColor tinyint NOT NULL,
	Face tinyint NOT NULL,
	XPos int NOT NULL,
	YPos int NOT NULL,
	StatPoints tinyint NOT NULL,
	StrStats tinyint NOT NULL,
	EndStats tinyint NOT NULL,
	DexStats tinyint NOT NULL,
	IntStats tinyint NOT NULL,
	SprStats tinyint NOT NULL,
	CurrentTitle int NULL,
	QuickBar varbinary(MAX) NULL,
	QuickBarState varbinary(MAX) NULL,
	Shortcuts varbinary(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Character SET (LOCK_ESCALATION = TABLE)
GO
DECLARE @v sql_variant 
SET @v = N'7636'
EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Tmp_Character', N'COLUMN', N'XPos'
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Slot DEFAULT ((0)) FOR Slot
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Map DEFAULT ((0)) FOR Map
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Level DEFAULT ((1)) FOR CharLevel
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Job DEFAULT ((0)) FOR Job
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Male DEFAULT ((0)) FOR Male
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_HP DEFAULT ((50)) FOR HP
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_SP DEFAULT ((50)) FOR SP
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_HPStones DEFAULT 10 FOR HPStones
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_SPStones DEFAULT 10 FOR SPStones
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Exp DEFAULT ((0)) FOR Exp
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Fame DEFAULT 0 FOR Fame
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Money DEFAULT ((5000)) FOR Money
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Hair DEFAULT ((0)) FOR Hair
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_HairColor DEFAULT ((0)) FOR HairColor
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_Face DEFAULT ((0)) FOR Face
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_XPos DEFAULT ((7636)) FOR XPos
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_YPos DEFAULT ((4610)) FOR YPos
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_StatPoints DEFAULT ((0)) FOR StatPoints
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_StrStats DEFAULT ((0)) FOR StrStats
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_EndStats DEFAULT ((0)) FOR EndStats
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_DexStats DEFAULT ((0)) FOR DexStats
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_IntStats DEFAULT ((0)) FOR IntStats
GO
ALTER TABLE dbo.Tmp_Character ADD CONSTRAINT
	DF_Character_SprStats DEFAULT ((0)) FOR SprStats
GO
SET IDENTITY_INSERT dbo.Tmp_Character ON
GO
IF EXISTS(SELECT * FROM dbo.Character)
	 EXEC('INSERT INTO dbo.Tmp_Character (ID, AccountID, Name, Slot, Map, CharLevel, Job, Male, HP, SP, Exp, Money, Hair, HairColor, Face, XPos, YPos, StatPoints, StrStats, EndStats, DexStats, IntStats, SprStats, CurrentTitle, QuickBar, QuickBarState, Shortcuts)
		SELECT ID, AccountID, Name, Slot, Map, CharLevel, Job, Male, HP, SP, Exp, Money, Hair, HairColor, Face, XPos, YPos, StatPoints, StrStats, EndStats, DexStats, IntStats, SprStats, CurrentTitle, QuickBar, QuickBarState, Shortcuts FROM dbo.Character WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Character OFF
GO
ALTER TABLE dbo.Equip
	DROP CONSTRAINT FK_Equip_Character
GO
DROP TABLE dbo.Character
GO
EXECUTE sp_rename N'dbo.Tmp_Character', N'Character', 'OBJECT' 
GO
ALTER TABLE dbo.Character ADD CONSTRAINT
	PK_Character PRIMARY KEY CLUSTERED 
	(
	ID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Equip ADD CONSTRAINT
	FK_Equip_Character FOREIGN KEY
	(
	Owner
	) REFERENCES dbo.Character
	(
	ID
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Equip SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
