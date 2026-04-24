/* VERSION 20260225 COMMUN TO ALL VAULTS */

SELECT
	[SafeName],
	[MemberName],
	[memberType], 
	[ACL_CODE]

USING
	Field1 AS [SafeName], 
	Field2 AS [MemberName], 
	Field3 AS [memberType], 
	Field4 AS [Permissions], 
	STRCAT( '#_', 
		STRCAT( CASE STRCNT( [Permissions], 'listAccounts=True' ) WHEN 0 THEN '_' ELSE 'L' END, 
		STRCAT( CASE STRCNT( [Permissions], 'useAccounts=True' ) WHEN 0 THEN '_' ELSE 'u' END, 
		STRCAT( CASE STRCNT( [Permissions], 'retrieveAccounts=True' ) WHEN 0 THEN '_' ELSE 'R' END, 
		STRCAT( '_', 
		STRCAT( CASE STRCNT( [Permissions], 'addAccounts=True' ) WHEN 0 THEN '_' ELSE 'C' END, 
		STRCAT( CASE STRCNT( [Permissions], 'updateAccountProperties=True' ) WHEN 0 THEN '_' ELSE 'P' END, 
		STRCAT( CASE STRCNT( [Permissions], 'updateAccountContent=True' ) WHEN 0 THEN '_' ELSE 'W' END, 
		STRCAT( CASE STRCNT( [Permissions], 'initiateCPMAccountManagementOperations=True' ) WHEN 0 THEN '_' ELSE 'T' END, 
		STRCAT( CASE STRCNT( [Permissions], 'specifyNextAccountContent=True' ) WHEN 0 THEN '_' ELSE 'n' END, 
		STRCAT( CASE STRCNT( [Permissions], 'renameAccounts=True' ) WHEN 0 THEN '_' ELSE 'r' END, 
		STRCAT( CASE STRCNT( [Permissions], 'deleteAccounts=True' ) WHEN 0 THEN '_' ELSE 'D' END, 
		STRCAT( CASE STRCNT( [Permissions], 'unlockAccounts=True' ) WHEN 0 THEN '_' ELSE 'U' END, 
		STRCAT( '_', 
		STRCAT( CASE STRCNT( [Permissions], 'manageSafe=True' ) WHEN 0 THEN '_' ELSE 'S' END, 
		STRCAT( CASE STRCNT( [Permissions], 'viewSafeMembers=True' ) WHEN 0 THEN '_' ELSE 'm' END, 
		STRCAT( CASE STRCNT( [Permissions], 'manageSafeMembers=True' ) WHEN 0 THEN '_' ELSE 'O' END, 
		STRCAT( CASE STRCNT( [Permissions], 'viewAuditLog=True' ) WHEN 0 THEN '_' ELSE 'a' END, 
		STRCAT( CASE STRCNT( [Permissions], 'backupSafe=True' ) WHEN 0 THEN '_' ELSE 'B' END, 
		STRCAT( '_', 
		STRCAT( CASE STRCNT( [Permissions], 'requestsAuthorizationLevel1=True' ) WHEN 0 THEN '_' ELSE 'A' END, 
		STRCAT( CASE STRCNT( [Permissions], 'requestsAuthorizationLevel2=True' ) WHEN 0 THEN '_' ELSE 'a' END, 
		STRCAT( CASE STRCNT( [Permissions], 'accessWithoutConfirmation=True' ) WHEN 0 THEN '_' ELSE 'N' END, 
		STRCAT( '_', 
		STRCAT( CASE STRCNT( [Permissions], 'moveAccountsAndFolders=True' ) WHEN 0 THEN '_' ELSE 'm' END, 
		STRCAT( CASE STRCNT( [Permissions], 'createFolders=True' ) WHEN 0 THEN '_' ELSE 'c' END, 
		STRCAT( CASE STRCNT( [Permissions], 'deleteFolders=True' ) WHEN 0 THEN '_' ELSE 'd' END, 
		'_#' ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) AS [ACL_CODE]

INTO
	STDOUT

FROM
	STDIN
