/* VERSION 20260225 COMMUN TO ALL VAULTS */

SELECT
	[Safename],
	[Member],
	[MemberType], 
	[MemberLocation], 
	[ListAccounts], 
	[UseAccounts], 
	[RetrieveAccounts], 
	[AddAccounts], 
	[UpdateAccountProperties], 
	[UpdateAccountContent], 
	[InitiateCPMAccountManagementOperations], 
	[SpecifyNextAccountContent], 
	[RenameAccounts], 
	[DeleteAccounts], 
	[UnlockAccounts], 
	[ManageSafe], 
	[ViewSafeMembers], 
	[ManageSafeMembers], 
	[ViewAuditLog], 
	[BackupSafe], 
	[RequestsAuthorizationLevel], 
	[AccessWithoutConfirmation], 
	[MoveAccountsAndFolders], 
	[CreateFolders], 
	[DeleteFolders]


USING
	[SAFE] AS [Safename], 
	[MEMBER] AS [Member], 
	[MemberType] AS [MemberType], 
	'Vault' AS [MemberLocation], 
	[ACL_CODE] AS [ACL_CODE], 

			/*            11111111112222222222  */
			/*  012345678901234567890123456789  */
			/* '#_LuR_CPWTnrDU_SmOaB_AaN_mcd_#' */
	CASE SUBSTR( [ACL_CODE],  2, 1 ) WHEN 'L' THEN 'TRUE' ELSE 'FALSE' END AS [ListAccounts], 
	CASE SUBSTR( [ACL_CODE],  3, 1 ) WHEN 'u' THEN 'TRUE' ELSE 'FALSE' END AS [UseAccounts], 
	CASE SUBSTR( [ACL_CODE],  4, 1 ) WHEN 'R' THEN 'TRUE' ELSE 'FALSE' END AS [RetrieveAccounts], 
	CASE SUBSTR( [ACL_CODE],  6, 1 ) WHEN 'C' THEN 'TRUE' ELSE 'FALSE' END AS [AddAccounts], 
	CASE SUBSTR( [ACL_CODE],  7, 1 ) WHEN 'P' THEN 'TRUE' ELSE 'FALSE' END AS [UpdateAccountProperties], 
	CASE SUBSTR( [ACL_CODE],  8, 1 ) WHEN 'W' THEN 'TRUE' ELSE 'FALSE' END AS [UpdateAccountContent], 
	CASE SUBSTR( [ACL_CODE],  9, 1 ) WHEN 'T' THEN 'TRUE' ELSE 'FALSE' END AS [InitiateCPMAccountManagementOperations], 
	CASE SUBSTR( [ACL_CODE], 10, 1 ) WHEN 'n' THEN 'TRUE' ELSE 'FALSE' END AS [SpecifyNextAccountContent], 
	CASE SUBSTR( [ACL_CODE], 11, 1 ) WHEN 'r' THEN 'TRUE' ELSE 'FALSE' END AS [RenameAccounts], 
	CASE SUBSTR( [ACL_CODE], 12, 1 ) WHEN 'D' THEN 'TRUE' ELSE 'FALSE' END AS [DeleteAccounts], 
	CASE SUBSTR( [ACL_CODE], 13, 1 ) WHEN 'U' THEN 'TRUE' ELSE 'FALSE' END AS [UnlockAccounts], 
	CASE SUBSTR( [ACL_CODE], 15, 1 ) WHEN 'S' THEN 'TRUE' ELSE 'FALSE' END AS [ManageSafe], 
	CASE SUBSTR( [ACL_CODE], 16, 1 ) WHEN 'm' THEN 'TRUE' ELSE 'FALSE' END AS [ViewSafeMembers], 
	CASE SUBSTR( [ACL_CODE], 17, 1 ) WHEN 'O' THEN 'TRUE' ELSE 'FALSE' END AS [ManageSafeMembers], 
	CASE SUBSTR( [ACL_CODE], 18, 1 ) WHEN 'a' THEN 'TRUE' ELSE 'FALSE' END AS [ViewAuditLog], 
	CASE SUBSTR( [ACL_CODE], 19, 1 ) WHEN 'B' THEN 'TRUE' ELSE 'FALSE' END AS [BackupSafe], 
	CASE SUBSTR( [ACL_CODE], 21, 1 ) WHEN 'A' THEN '1'    ELSE '0'     END AS [RequestsAuthorizationLevel], 
	CASE SUBSTR( [ACL_CODE], 23, 1 ) WHEN 'N' THEN 'TRUE' ELSE 'FALSE' END AS [AccessWithoutConfirmation], 
	CASE SUBSTR( [ACL_CODE], 25, 1 ) WHEN 'm' THEN 'TRUE' ELSE 'FALSE' END AS [MoveAccountsAndFolders], 
	CASE SUBSTR( [ACL_CODE], 26, 1 ) WHEN 'c' THEN 'TRUE' ELSE 'FALSE' END AS [CreateFolders], 
	CASE SUBSTR( [ACL_CODE], 27, 1 ) WHEN 'd' THEN 'TRUE' ELSE 'FALSE' END AS [DeleteFolders]

INTO
	STDOUT

FROM
	STDIN
