-- ==============================================================================
-- 
-- Script name   :   SQLServer-Properties.sql
-- Description   :   SQL script to get SQL Server instance and OS level info
-- Author        :   Carlos Robles
-- Email         :   crobles@dbamastery.com
-- Twitter       :   @dbamastery
-- Date          :   2020-11
-- 
-- ==============================================================================

-- Get SQL Server Instance and OS Level Details
-- ==============================================================================
SELECT
    SERVERPROPERTY('ServerName') AS [Instance Name],
    CASE LEFT(CONVERT(VARCHAR, SERVERPROPERTY('ProductVersion')),4) 
			WHEN '11.0' THEN 'SQL Server 2012'
			WHEN '12.0' THEN 'SQL Server 2014'
			WHEN '13.0' THEN 'SQL Server 2016'
			WHEN '14.0' THEN 'SQL Server 2017'
            WHEN '15.0' THEN 'SQL Server 2019'
			ELSE 'Newer than SQL Server 2019'
		END AS [Version Build],
    SERVERPROPERTY('ProductVersion') AS [Product Version],
    SERVERPROPERTY('ProductUpdateLevel') AS [CU],
    RIGHT(@@version, LEN(@@version)- 3 -charindex (' ON ', @@VERSION)) [OS Version],
    SERVERPROPERTY ('Edition') AS [Edition],
    [cpu_count] AS [CPUs],
    [physical_memory_kb]/1024 AS [RAM (MB)]
FROM sys.dm_os_sys_info;