USE TestLike;
GO
SET STATISTICS TIME ON;
GO

-- Default collation, French_CI_AS
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeVarcharSmall_WindowsCollation
	WHERE col1 LIKE '%vb%'
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO

-- SQL collation
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeVarcharSmall_WindowsCollation
	WHERE col1 LIKE '%vb%' COLLATE SQL_Latin1_General_CP1_CI_AS
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO

-- NVARCHAR, Default collation, French_CI_AS
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeNVarcharSmall_WindowsCollation
	WHERE col1 LIKE N'%vb%'
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO

-- NVARCHAR, SQL collation
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeNVarcharSmall_WindowsCollation
	WHERE col1 LIKE N'%vb%' COLLATE SQL_Latin1_General_CP1_CI_AS
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO

-- NVARCHAR, UTF-8 collation
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeNVarcharSmall_WindowsCollation
	WHERE col1 LIKE N'%vb%' COLLATE French_100_CI_AI_SC_UTF8
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO

-- UTF8
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeVarcharSmall_UTF8
	WHERE col1 LIKE N'%vb%'
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO

-- UTF8, SQL collation
WITH cte AS (
	SELECT *
	,ROW_NUMBER() OVER (ORDER BY col1) rn
	FROM dbo.TestLikeVarcharSmall_UTF8
	WHERE col1 LIKE N'%vb%' COLLATE SQL_Latin1_General_CP1_CI_AS
)
SELECT *
FROM cte
WHERE rn BETWEEN 0 AND 100
OPTION (MAXDOP 1);
GO
