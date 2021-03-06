'###########################################################
' Function name: fBusFilter
' Description:   Start the function with call to fGuiLogIn ,Call fGuiFilter
' Parameters:
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
' zehava comment
' New comment!!!
Public Function fBusFilter

	Call fGuiLogIn()  
	
	Call fSelectCustomer() 
	
	Call fGuiFilter() 
	
End Function
'###########################################################

'###########################################################
' Function name: fBusSanity
' Description:  The function check that all the pages are loaded correctly.
' Parameters:
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusSanity
	
	'Call fGuiLogIn()  
	
	'Call fSelectCustomer() 

	Call fGuiCheckPageIsLoaded(globaldictionary("PROTLET_NAME"), globaldictionary("PARENT_PAGE"), globaldictionary("PAGE_LINK"), globaldictionary("OBJECT_IN_PAGE"), globaldictionary("OBJECT_TYPE"),globaldictionary("SYNC_TIME"), True)	

End Function
'###########################################################


'###########################################################
' Function name: fBusSort
' Description:   Start the function with call to fGuiLogIn ,Call fGuiSort
' Parameters:
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusSort

	Call fGuiLogIn()

	Call fSelectCustomer()
		
	Call fGuiSort(globaldictionary("PROTLET_NAME"), globaldictionary("COLUMN_NAME"), globaldictionary("SORT_TYPE"))
	
End Function
'###########################################################

'###########################################################
' Function name: fBusGrandTotal
' Description:   Start the function with call to fGuiLogIn ,Call fGuiSort
' Parameters:
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusGrandTotal
   
	Call fGuiLogIn() 

	Call fSelectCustomer()
	
	Call fGuiGrandTotal(globaldictionary("PROTLET_NAME")) 

End Function
'###########################################################


''###########################################################
'' Function name: fBusDBValidations
'' Description:  Check all DB Validations
'' Parameters:  Protlet Name,
'' Return value:  Success - True
''				 Failure - False
'' Example:
''###########################################################
Public Function fBusDBValidation()
	
	Call fGuiLogin()
	
	Call fGuiSelectCustomer()
	
	Call fGuiCompareUIVSDB(globaldictionary("PORTLET_NAME"),globaldictionary("PARENT_PAGE"),globaldictionary("PAGE_LINK"),globaldictionary("TABLE_NAME"),globaldictionary("OBJECT_IN_PAGE"),globaldictionary("OBJECT_TYPE"),globaldictionary("SYNC_TIME"))
	
End Function
''###########################################################

''###########################################################
'' Function name: fBusDBValidations
'' Description:  Check all DB Validations
'' Parameters:  Protlet Name,
'' Return value:  Success - True
''				 Failure - False
'' Example:
''###########################################################
'Public Function fBusDBValidations
'
'	Call fGuiLogIn() 
'
'	Call fSelectCustomer()
'	
'	'Title - Portlet name
'	Call fWriteHtmlReportRow("fBusDBValidations" ,globaldictionary("PROTLET_NAME"), "", "")
'
'	sSQL = fBuildSQL(globaldictionary("PROTLET_NAME"),null,null)
'	
'	'--TODO: Move this section to a function in the GUI level
'	'--/*
'	Browser("iBasis Customer Portal").Page("Home").Link("Finance").FireEvent "OnMouseOver"
'	Browser("iBasis Customer Portal").Page("Home").Link(globaldictionary("PROTLET_NAME")).Click
'	If Browser("iBasis Customer Portal").Page(globaldictionary("PROTLET_NAME")).Exist(20) = "False" Then
'		Call fReport("fBusDBValidations -" & globaldictionary("PROTLET_NAME"),  "Navigate to the protlet", "FAIL",  "Failed to Navigate the protlet :" & globaldictionary("PROTLET_NAME"), 0)	
'		fBusDBValidations = False
'		'Exit Function
'	End If
'	If fSyncByImage(60) = False Then
'		Call fReport("fSyncByImage -" & globaldictionary("PROTLET_NAME"), "Sync for data refresh", "FAIL",  "Sync failed after 60 seconds", 0)	
'		fBusDBValidations = False
'		Exit Function
'	End If
'	'--*/
'
'	Call fGuiDBValidations(globaldictionary("PROTLET_NAME"),sSQL)   
'
'End Function
'###########################################################

'###########################################################
' Function name: fBusHomeDBValidations
' Description:  Check all DB Validations
' Parameters:  Protlet Name,
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusHomeDBValidations

	'Login
    Call fGuiLogIn()

	'Select Customer
    Call fSelectCustomer()
	
	'DB validation for Finance main page
	Call fBusHomeDBValidations()

End Function
'#############################################################

'###########################################################
' Function name: fBusOrganizationDefaults
' Description:  Save to KEEP_REFER all organization's defaults
' Parameters:  Protlet Name,
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusOrganizationDefaults
	
	Call fGuiLogIn() 

	Call fSelectCustomer()

	Call fGuiOrganizationDefaults() 

End Function
'############################################################

'###########################################################
' Function name: fBusCheckDefaults
' Description:  Compare in each protlet the default values from 
				'Organization Defaults in Admin protlet 
' Parameters:  Protlet Name,
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusCheckDefaults

	'Login
    Call fGuiLogIn() 

	'Select Customer Name
	Call fSelectCustomer()

	'Check that all dates/currencies formats in the application match to the customer/user definitions
	Call fGuiCheckDefaults() 
    
End Function
'####################################################################

'###########################################################
' Function name: fBusCheckPermissions
' Description: Enter to App with different customers
				'and  check their permissions
' Parameters:  Protlet Name,
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusCheckPermissions

	'Login
    Call fGuiLogIn() 
	
	'Check permissions
	Call fGuiCheckPermissions(GlobalDictionary("ROLE")) 
	
End Function
'####################################################################

'###########################################################
' Function name: fBusUserActions
' Description: create/update/delete/resetpassword user
' Parameters:  Protlet Name,
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusUserActions

    Call fGuiLogIn() 

	Call fGuiUserActions()
	
End Function
'############################################################

'###########################################################
' Function name: fBusAlerts
' Description: The function create an HTML report that supply details for the alerts that customers are expected to receive
' Parameters: Customers ids list (in the parameters excel)
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusAlerts

   Call fGuiAlerts() 

End Function
'############################################################

'###########################################################
' Function name: fPermissionManagement
' Description: 
' Parameters: 
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusRolesManagement

	'Login
    Call fGuiLogIn() 
		
	'Add new role group
  	Call fGuiAddNewRoleGroup()
   
   'Assign Roles to Group
    Call fGuiAssignRolestoGroup()
    
   'Assign role group to organization
    Call fGuiAssignRoleGroupToOrg() 
    
   'Remove role group
'   Call fGuiRemoveRoleGroup() 

End Function
'############################################################


'###########################################################
' Function name: fBusDBVerification
' Description: 
' Parameters: 
' Return value:  Success - True
'				 Failure - False
' Example:
'###########################################################
Public Function fBusDBVerification()
	Dim objWorkbookUI, objWorkbookDB, objWorkbookResults
	Dim iMismatchCounter, iComparedValues

	'Login and select customer
    'Call fGuiLogIn()  
	'Call fSelectCustomer()  
	
	'Navigate to page
	'TODO: write the fucation below - funcation to navige to page
	'Call fNavigateTopage(GlobalDictionary("PROTLET_NAME"))

	err.clear

	sHeaders = "INVOICE ID,INVOICE DATE,CURRENCY,INVOICE AMOUNT,PAID AMOUNT,OTHER CLEARED AMOUNT,OPEN AMOUNT,CONVERSION CURRENCY RATE,CONVERTED OPEN AMOUNT"
	sFilePath = "C:\Users\ybenshushan\Desktop\DBValidations\"
	sFileName = GlobalDictionary("PROTLET_NAME")
	sGridName = GlobalDictionary("PROTLET_NAME")

	iRows = fGuiExportGridIntoExcel("iBasis Customer Portal", "Invoices", "Invoices Table", "Invoices Headers", sFilePath, sFileName, sGridName)
	Call fGuiExportDBIntoExcel(sFilePath, sFileName, sGridName, iRows, sHeaders)
	
	Call fGuiOpenReportsWorkbooks(objWorkbookDB, objWorkbookUI, objWorkbookResults, sFilePath, sGridName)
	
	iMismatchCounter = fGuiCompareReportsSheet(objWorkbookDB, objWorkbookUI, objWorkbookResults, iComparedValues)
	
End Function
'############################################################

