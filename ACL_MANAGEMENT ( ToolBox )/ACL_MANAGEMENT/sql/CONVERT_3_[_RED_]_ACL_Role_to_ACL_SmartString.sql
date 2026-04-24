/* VERSION 20260225 FOR RED VAULT OR LAB BUBBLES ONLY */

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
		WHEN	'(M)_MANAGE_PROPERTIES_(M)'              	THEN	'#_L____P_T_r_U__m_a__________#'	/* For CA_DATA_ADMINS on [-CEPSRT-] + END-USERS on [-B-RECORD_ADOPTION-] SAFES... */
		WHEN	'(M)_MANAGE_FORMS_(M)'                   	THEN	'#_LuR__PWT_rDU__m_a____N_____#'	/* For CA_MOVE_ADMINS on [-BD-] + CA_SAFE_ADMINS on [-B-] SAFES... */
		WHEN	'(M)_MANAGE_RECORDS_(M)'                 	THEN	'#_LuR_CPWT_rDU__m_a____N_____#'	/* For CA_DATA_ADMINS on [-B-RECORD_ADOPTION-] + CA_MOVE_ADMINS on [-CEPSRT-] SAFES... */
		WHEN	'(M)_MANAGE_PERMISSION_(M)'              	THEN	'#_LuR___WT___U__mOa__A_N_____#'	/* For CA_SAFE_ADMINS on [-PSRT-] SAFES... */
		WHEN	'(M)_STORE_ARCHIVE_(M)'                  	THEN	'#_L___CPWT_r____m_a__________#'	/* For CA_DATA/MOVE/SAFE_ADMINS on [-Z-] SAFES... */
		WHEN	'(M)_CREATE_FORMS_(M)'                   	THEN	'#_L___CPWT_rD___m_a__________#'	/* For END-USERS on [-B/D-] Safes... */
		WHEN	'(C)_CONNECT_ONLY_(C)'                   	THEN	'#_Lu_________________________#'	
		WHEN	'(C)_READ_ONLY_(C)'                      	THEN	'#_LuR________________________#'	
		WHEN	'(C)_APPROVER_(C)'                       	THEN	'#_L_____________mO___A_______#'	
		WHEN	'(C)_ACCOUNTS_MANAGER_(C)'               	THEN	'#_LuR_CPWTnrDU__mOa____N_mcd_#'	
		WHEN	'(R)_APPROVER_(R)'                       	THEN	'#_L_____________m_a__A_______#'	
		WHEN	'(R)_UNLOCKER_(R)'                       	THEN	'#_L__________U__m_a__________#'	
		WHEN	'(R)_APPROVER+UNLOCKER_(R)'              	THEN	'#_L__________U__m_a__A_______#'	
		WHEN	'(R)_WRITE+TASKS_(R)'                    	THEN	'#_L_____WT______m_a__________#'	
		WHEN	'(R)_RESETTER_(R)'                       	THEN	'#_L_____WT___U__m_a__________#'	
		WHEN	'(R)_RESETTER+APPROVER_(R)'              	THEN	'#_L_____WT___U__m_a__A_______#'	
		WHEN	'(R)_EMERGENCY_(R)'                      	THEN	'#_LuR____T______m_a__________#'	
		WHEN	'(R)_END-USER_(R)'                       	THEN	'#_LuR___WT______m_a__________#'	
		WHEN	'(R)_END-USER+APPROVER_(R)'              	THEN	'#_LuR___WT______m_a__A_______#'	
		WHEN	'(R)_END-USER+UNLOCKER_(R)'              	THEN	'#_LuR___WT___U__m_a__________#'	
		WHEN	'(R)_END-USER+APPROVER+UNLOCKER_(R)'     	THEN	'#_LuR___WT___U__m_a__A_______#'	
		WHEN	'(R)_END-USER+AWC_(R)'                   	THEN	'#_LuR___WT______m_a____N_____#'	
		WHEN	'(R)_END-USER+APPROVER+AWC_(R)'          	THEN	'#_LuR___WT______m_a__A_N_____#'	
		WHEN	'(R)_END-USER+UNLOCKER+AWC_(R)'          	THEN	'#_LuR___WT___U__m_a____N_____#'	
		WHEN	'(R)_END-USER+APPROVER+UNLOCKER+AWC_(R)' 	THEN	'#_LuR___WT___U__m_a__A_N_____#'	
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
