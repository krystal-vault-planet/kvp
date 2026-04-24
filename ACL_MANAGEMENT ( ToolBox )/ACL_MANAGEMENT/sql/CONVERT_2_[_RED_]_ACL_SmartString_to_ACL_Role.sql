/* VERSION 20260225 FOR RED VAULT OR LAB BUBBLES ONLY */

SELECT
	[SafeName],
	[OwnerName],
	[memberType], 
	[ACL_ROLE]

USING
	Field1 AS [SafeName], 
	Field2 AS [OwnerName], 
	Field3 AS [memberType], 
	Field4 AS [ACL_CODE], 
	CASE [ACL_CODE]

		/*	VAULT MANAGEMENT ROLE MATRIX ( FOR INTERNAL USERS ONLY )				*/
		WHEN	'#_LuR_CPWTnrDU_SmOaB___N_mcd_#'	THEN	'(M)_MASTER_(M)'                         	/* For MASTER ONLY */
		WHEN	'#_LuR_CPWTnrDU_SmOaB_A_N_mcd_#'	THEN	'(M)_SUPER_ADMIN_(M)'                    	/* For ADMINISTRATOR ONLY */
		WHEN	'#_L____P_T_r_U__m_a__________#'	THEN	'(M)_MANAGE_PROPERTIES_(M)'              	/* For CA_DATA_ADMINS on [-CEPSRT-] + END-USERS on [-B-RECORD_ADOPTION-] SAFES... */
		WHEN	'#_LuR__PWT_rDU__m_a____N_____#'	THEN	'(M)_MANAGE_FORMS_(M)'                   	/* For CA_MOVE_ADMINS on [-BD-] + CA_SAFE_ADMINS on [-B-] SAFES... */
		WHEN	'#_LuR_CPWT_rDU__m_a____N_____#'	THEN	'(M)_MANAGE_RECORDS_(M)'                 	/* For CA_DATA_ADMINS on [-B-RECORD_ADOPTION-] + CA_MOVE_ADMINS on [-CEPSRT-] SAFES... */
		WHEN	'#_LuR___WT___U__mOa__A_N_____#'	THEN	'(M)_MANAGE_PERMISSION_(M)'              	/* For CA_SAFE_ADMINS on [-PSRT-] SAFES... */
		WHEN	'#_L___CPWT_r____m_a__________#'	THEN	'(M)_STORE_ARCHIVE_(M)'                  	/* For CA_DATA/MOVE/SAFE_ADMINS on [-Z-] SAFES... */
		WHEN	'#_L___CPWT_rD___m_a__________#'	THEN	'(M)_CREATE_FORMS_(M)'                   	/* For END-USERS on [-B/D-] Safes... */

		/*	CYBERARK DEFAULT ROLES ( AS SHOWN ON PVWA PERMISSION MENU )				*/
		WHEN	'#_Lu_________________________#'	THEN	'(C)_CONNECT_ONLY_(C)'                   
		WHEN	'#_LuR________________________#'	THEN	'(C)_READ_ONLY_(C)'                      
		WHEN	'#_L_____________mO___A_______#'	THEN	'(C)_APPROVER_(C)'                       
		WHEN	'#_LuR_CPWTnrDU__mOa____N_mcd_#'	THEN	'(C)_ACCOUNTS_MANAGER_(C)'               

		/*	VAULT STANDARD ROLE MATRIX ( FOR EXTERNAL END-USERS )					*/
		WHEN	'#_L_____________m_a__A_______#'	THEN	'(R)_APPROVER_(R)'                       
		WHEN	'#_L__________U__m_a__________#'	THEN	'(R)_UNLOCKER_(R)'                       
		WHEN	'#_L__________U__m_a__A_______#'	THEN	'(R)_APPROVER+UNLOCKER_(R)'              
		WHEN	'#_L_____WT______m_a__________#'	THEN	'(R)_WRITE+TASKS_(R)'                    
		WHEN	'#_L_____WT___U__m_a__________#'	THEN	'(R)_RESETTER_(R)'                       
		WHEN	'#_L_____WT___U__m_a__A_______#'	THEN	'(R)_RESETTER+APPROVER_(R)'              
		WHEN	'#_LuR____T______m_a__________#'	THEN	'(R)_EMERGENCY_(R)'                      
		WHEN	'#_LuR___WT______m_a__________#'	THEN	'(R)_END-USER_(R)'                       
		WHEN	'#_LuR___WT______m_a__A_______#'	THEN	'(R)_END-USER+APPROVER_(R)'              
		WHEN	'#_LuR___WT___U__m_a__________#'	THEN	'(R)_END-USER+UNLOCKER_(R)'              
		WHEN	'#_LuR___WT___U__m_a__A_______#'	THEN	'(R)_END-USER+APPROVER+UNLOCKER_(R)'     
		WHEN	'#_LuR___WT______m_a____N_____#'	THEN	'(R)_END-USER+AWC_(R)'                   
		WHEN	'#_LuR___WT______m_a__A_N_____#'	THEN	'(R)_END-USER+APPROVER+AWC_(R)'          
		WHEN	'#_LuR___WT___U__m_a____N_____#'	THEN	'(R)_END-USER+UNLOCKER+AWC_(R)'          
		WHEN	'#_LuR___WT___U__m_a__A_N_____#'	THEN	'(R)_END-USER+APPROVER+UNLOCKER+AWC_(R)' 

		/*	VAULT TECHNICAL ROLE MATRIX ( FOR BOTS AND CYBERARK COMPONENTS )			*/
		WHEN	'#_LuR_CPWTnrDU____a______mcd_#'	THEN	'(T)_CPM-ENGINE_(T)'                     
		WHEN	'#_L__________U_______________#'	THEN	'(T)_PSM_UNLOCKER_(T)'                   

		/*	VAULT INTERNAL ROLE MATRIX ( FOR BUILT-IN GROUPS )					*/
		WHEN	'#__________________B_________#'	THEN	'(i)_BACKUP_(i)'                         
		WHEN	'#_L_____________m_a__________#'	THEN	'(i)_AUDITOR_(i)'                        
		WHEN	'#____________U_S_________mcd_#'	THEN	'(i)_OPERATOR_(i)'                       
		WHEN	'#_LuR_CPWTnrDU_SmOaB_____mcd_#'	THEN	'(i)_BATCH_(i)'                          

		/*	ONLY FOR OWNERS WITHOUT PERMISSION ( STANDBY OR ENE ADVANCED NOTIFICATION )		*/
		WHEN	'#____________________________#'	THEN	'(?)_NO_PERMISSION_(?)'                  

		ELSE [ACL_CODE]
	END AS [ACL_ROLE]

INTO
	STDOUT

FROM
	STDIN
