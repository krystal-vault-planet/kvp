/* VERSION 20260225 DEFAULT ( NATIVE ) ACL ROLES BY CYBERARK */

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

		/*	CYBERARK DEFAULT ROLES ( AS SHOWN ON PVWA PERMISSION MENU )				*/
		WHEN	'#_Lu_________________________#'	THEN	'(C)_CONNECT_ONLY_(C)'                   
		WHEN	'#_LuR________________________#'	THEN	'(C)_READ_ONLY_(C)'                      
		WHEN	'#_L_____________mO___A_______#'	THEN	'(C)_APPROVER_(C)'                       
		WHEN	'#_LuR_CPWTnrDU__mOa____N_mcd_#'	THEN	'(C)_ACCOUNTS_MANAGER_(C)'               

		/*	VAULT STANDARD ROLE MATRIX ( FOR EXTERNAL END-USERS )					*/
		/*	TO BE COMPLETED...									*/

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
