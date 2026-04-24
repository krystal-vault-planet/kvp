/* VERSION 20260225 DEFAULT ( NATIVE ) ACL ROLES BY CYBERARK */

SELECT
	[SAFE],
	[MEMBER],
	[MemberType], 
	[ACL_CODE]

USING
	[SAFE] AS [SAFE], 
	[MEMBER] AS [MEMBER], 
	[MemberType] AS [MemberType], 
	[ACL_ROLE] AS [ACL_ROLE], 
	CASE [ACL_ROLE]

		WHEN	'(M)_MASTER_(M)'                         	THEN	'#_LuR_CPWTnrDU_SmOaB___N_mcd_#'	/* For MASTER ONLY */
		WHEN	'(M)_SUPER_ADMIN_(M)'                    	THEN	'#_LuR_CPWTnrDU_SmOaB_A_N_mcd_#'	/* For ADMINISTRATOR ONLY */
		WHEN	'(C)_CONNECT_ONLY_(C)'                   	THEN	'#_Lu_________________________#'	
		WHEN	'(C)_READ_ONLY_(C)'                      	THEN	'#_LuR________________________#'	
		WHEN	'(C)_APPROVER_(C)'                       	THEN	'#_L_____________mO___A_______#'	
		WHEN	'(C)_ACCOUNTS_MANAGER_(C)'               	THEN	'#_LuR_CPWTnrDU__mOa____N_mcd_#'	
		WHEN	'(T)_CPM-ENGINE_(T)'                     	THEN	'#_LuR_CPWTnrDU____a______mcd_#'	
		WHEN	'(T)_PSM_UNLOCKER_(T)'                   	THEN	'#_L__________U_______________#'	
		WHEN	'(i)_BACKUP_(i)'                         	THEN	'#__________________B_________#'	
		WHEN	'(i)_AUDITOR_(i)'                        	THEN	'#_L_____________m_a__________#'	
		WHEN	'(i)_OPERATOR_(i)'                       	THEN	'#____________U_S_________mcd_#'	
		WHEN	'(i)_BATCH_(i)'                          	THEN	'#_LuR_CPWTnrDU_SmOaB_____mcd_#'	
		WHEN	'(?)_NO_PERMISSION_(?)'                  	THEN	'#____________________________#'	

		ELSE [ACL_ROLE]
	END AS [ACL_CODE]

INTO
	STDOUT

FROM
	STDIN
