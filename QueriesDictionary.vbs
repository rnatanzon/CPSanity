Option Explicit

Public Function fCheckQueryResults (ByVal sStepName, ByVal sStepDesc, ByVal rc)

'----------------------------------------------------------------
' Function name: fCheckQueryResults
' Description: The function check the query results
' Parameters: sStepName, sStepDesc, rc
' Return value: Success - True, Failure - False
'----------------------------------------------------------------
	
	Dim sResult
    If rc = False Then					'DB connection failed /Ouery execution failed
		Call fReport(sStepName,sStepDesc,"FAIL","DB connection failed /Ouery execution failed",0)
		fCheckQueryResults = False
		Exit Function		
	ElseIf rc = NO_RECORDS_FOUND Then	'NO_RECORDS_FOUND
		Call fReport(sStepName,sStepDesc,"INFO","No records return by the query",1)
		fCheckQueryResults = False
		Exit Function
    End If

	fCheckQueryResults = True
End Function

Public Function fGetQuery (ByVal sQueryName, ByVal arrParamValue)
	
'----------------------------------------------------------------
' Function name: fGetQuery
' Description: The function reutrns sql query by query name. And replace all parameters in query [optional]
' Parameters: sQueryName - 	Name on QueriesDictionary, [optional]arrParamValue - 2d array of parameters values: Key + value 
'							(If there are no query parameters, send an empty string - ""
' Return value: Success - SQL query
'----------------------------------------------------------------
	
	Dim sSQL

	sSQL = QueriesDictionary(lcase(sQueryName))
	If arrParamValue(0,0) <> "" Then
		For i = 0 to uBound(arrParamValue) 
			If instr (1,sSQL, "<" & arrParamValue(i,0) & ">") > 0 Then
				sSQL = Replace(sSQL, "<" & arrParamValue(i,0) & ">", arrParamValue(i,1))
			End If
		Next
	End If

	fGetQuery = sSQL
	
End Function

'----------------------------------------------------------------
'---------------------  Queries dictionary  ---------------------
'----------------------------------------------------------------

Dim QueriesDictionary
Set QueriesDictionary = CreateObject("Scripting.Dictionary")


QueriesDictionary("invoices_query") = "" & _
"SELECT document_reference ""INVOICE ID"" " & _
",to_char(document_date,'mm/dd/yy') ""INVOICE DATE"" " & _
",document_currency ""CURRENCY"" " & _
",to_char(document_amount,'999,999,990.99') ""INVOICE AMOUNT"" " & _
",to_char(paid_amount,'999,999,990.99') ""PAID AMOUNT""" & _
",to_char(cleared_amount,'999,999,990.99') ""OTHER CLEARED AMOUNT"" " & _
",to_char(open_amount,'999,999,990.99') ""OPEN AMOUNT"" " & _
",to_char(""CONVERSION CURRENCY RATE"",'990.9999') ""CONVERSION CURRENCY RATE"" " & _
",to_char(open_amount*""CONVERSION CURRENCY RATE"",'999,999,990.99') ""CONVERTED OPEN AMOUNT"" " & _
"FROM( " & _
"    SELECT document_reference " & _
"    ,document_date " & _  
"    ,document_currency " & _
"    ,document_amount " & _
"    ,paid_amount " & _
"    ,cleared_amount " & _
"    ,open_amount " & _
"    ,(SELECT distinct round(RATE,4) FROM billing.EXCHANGE_RATE WHERE FROM_CURRENCY = document_currency AND TO_CURRENCY = '<TO_CURRENCY>') ""CONVERSION CURRENCY RATE"" " & _
"    ,YEAR " & _
"    ,COMPANY  " & _
"    ,SAP_DOCUMENT_NUMBER " & _ 
"    ,SAP_DOCUMENT_LINE_ITEM " & _
"    FROM BILLING.CUSTOMER_INVOICE_HISTORY " & _
"    WHERE customer_id in(SELECT ID FROM billing.CUSTOMER_MASTER WHERE headquarters = <CUSTOMER_ID>)  " & _   
") " & _
"where 1=1 " & _
"order by document_date DESC "& _
",YEAR, COMPANY, SAP_DOCUMENT_NUMBER, SAP_DOCUMENT_LINE_ITEM"
'"--Filter BY "INVOICE ID" _
'"--and UPPER(document_reference) like UPPER('%' || :FilterInvoiceID || '%')
'"--Filter by "INVOICE DATE"
'"--and document_date >= to_date(:FilterInvoiceDate, 'mm/dd/yy')  -- or = or <=    
'"--Filter BY "INVOICE AMOUNT"
'"--and document_amount >= :FilterInvoiceAmount  -- or = or <= 
'"--Filter BY "PAID AMOUNT"
'"--and paid_amount >= :FilterPaidAmount  -- or = or <= 
'"--Filter BY "OTHER CLEARED AMOUNT"
'"--and cleared_amount >= :FilterClearedAmount  -- or = or <=  
'"--Filter BY "OPEN AMOUNT"
'"--and  open_amount >= :FilterOpenAmount  -- or = or <=   
'"--Filter BY "CURRENCY"
'"--and UPPER(document_currency) like UPPER('%' || :FilterCurrency || '%') " & _



