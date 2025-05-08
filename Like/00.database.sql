SET NOCOUNT ON;
GO

CREATE DATABASE [TestLike]
 COLLATE French_CI_AS
GO

ALTER DATABASE [TestLike] SET RECOVERY SIMPLE 
ALTER DATABASE [TestLike] SET TARGET_RECOVERY_TIME = 60 SECONDS 
ALTER DATABASE [TestLike] SET DELAYED_DURABILITY = FORCED 
GO

USE [TestLike]
GO

CREATE TABLE dbo.TestLikeVarcharSmall_WindowsCollation (
    col1 VARCHAR(40) NOT NULL,
    col2 VARCHAR(60) NOT NULL
);

INSERT INTO dbo.TestLikeVarcharSmall_WindowsCollation
SELECT TOP 1000000 m.text, text
FROM sys.messages m
CROSS JOIN (SELECT TOP 200 1 FROM sys.messages) v (c)
WHERE LEN(m.text) BETWEEN 30 AND 40
AND m.language_id IN (1033, 1031, 1036, 1030, 3082, 1040, 1043, 2068)
ORDER BY NEWID();
GO

CREATE TABLE dbo.TestLikeNVarcharSmall_WindowsCollation (
    col1 NVARCHAR(40) NOT NULL,
    col2 NVARCHAR(60) NOT NULL
);

INSERT INTO dbo.TestLikeNVarcharSmall_WindowsCollation
SELECT * FROM dbo.TestLikeVarcharSmall_WindowsCollation;
GO

-- DROP TABLE dbo.TestLikeVarcharSmall_UTF8
CREATE TABLE dbo.TestLikeVarcharSmall_UTF8 (
    col1 VARCHAR(40) COLLATE French_100_CI_AI_SC_UTF8 NOT NULL,
    col2 VARCHAR(60) COLLATE French_100_CI_AI_SC_UTF8 NOT NULL
);

INSERT INTO dbo.TestLikeVarcharSmall_UTF8
SELECT * FROM dbo.TestLikeVarcharSmall_WindowsCollation;
GO
