Imports System.Collections
Imports System.Collections.Specialized
Imports System.ComponentModel
Imports System.Data
Imports System.Drawing
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Imports DotNetIntegrationKit

Public Class requestpage
    Inherits System.Web.UI.Page




    Private strHEX As String, strPGActualReponseWithChecksum As String, strPGActualReponseEncrypted As String, strPGActualReponseDecrypted As String, strPGresponseChecksum As String, strPGTxnStatusCode As String
    Private strSplitDecryptedResponse As String(), strPGChecksum As String(), strPGTxnString As String()

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            TXT_MerchantTxnRefNo.Text = DateTime.Now.ToString("ddMMyyyyHHmmss")
            TXT_uniqueCustomerID.Text = DateTime.Now.ToString("ddMMyyyyHHmmss")

            TXT_TxnDate.Text = DateTime.Now.ToString("dd-MM-yyyy")
        End If
    End Sub
    Protected Sub BTN_Submit_Click(sender As Object, e As EventArgs) Handles BTN_Submit.Click
        Try
            lblResponse.Text = ""
            lblError.Text = ""
            Dim objRequestURL As New RequestURL()
            '
            '                 //For BSNL
            '                String response = objRequestURL.SendRequest
            '                    (
            '                  //                "T"
            '                  //              , txtmerchantId.Value
            '                  //              , StrPortalTxnId.Value
            '                  //              , "{AccountNo:" + StrUNIQUEID.Value + "}{InvoiceNo:" + StrBILLNO.Value + "}{CircleCode:" + StrCIRCLE.Value + "}{SSAName:" + StrSSA.Value + "}"
            '                  //              , txtAmt.Value
            '                  //              , StrCurrencyType.Value
            '                  //              , StrUNIQUEID.Value
            '                  //              , System.Configuration.ConfigurationSettings.AppSettings["TECHPROCESSReturnURL"]
            '                  //              , "NA"
            '                  //              , "NA"
            '                  //              , serviceType + "_" + txtAmt.Value + "_0.0"
            '                  //              , DateTime.Now.Date.ToString("dd-MM-yyyy")
            '                  //              , "NA"
            '                  //              , "NA"
            '                  //              , txtBankCode.Value
            '                  //              , "NA"
            '                  //              , txtPropertyPath.Value 
            '                  
            '                  );
            '                 

            'response = objRequestURL.SendRequest("T","T2658","7423002","NA","300.00","INR","NA","http://10.10.60.80/PGSingleURlKit1_1/ResponsePage.aspx","NA","NA","Test_120.0_0.0","04-03-2014","NA","NA","470","NA","D:\\DotnetIntegrationKit\\Merchant.property");

            If [String].IsNullOrEmpty(TXT_propertyPath.Text) AndAlso [String].IsNullOrEmpty(TXT_IsIv.Text) AndAlso [String].IsNullOrEmpty(TXT_IsKey.Text) Then
                lblResponse.Text = "D:\gauthamthota\kims\kims\propertyfile\Merchant.property"
                'lblResponse.Text = "D:\Hosting\12112540\html\propertyfile\Merchant.property"


                Return
            End If


            Dim response__1 As [String] = ""

            If ddlRequest.SelectedValue = "0" Then
                lblError.Text = "Please Select Request Using"
            Else
                lblError.Text = Nothing
                If ddlRequest.SelectedValue = "1" Then
                    'if (ddlRequestType.SelectedValue == "0")
                    '{
                    '    lblError.Text = "Please Select Request Type";
                    '}
                    'else
                    '{
                    lblError.Text = Nothing
                    If TXT_requesttype.Text.ToUpper() = "TCI" Then
                        response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                            TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                            TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_propertyPath.Text, TXT_CardID.Text)
                    Else
                        response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                            TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                            TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_propertyPath.Text)
                        ' }
                    End If
                Else
                    If TXT_requesttype.Text.ToUpper() = "TWC" OrElse TXT_requesttype.Text.ToUpper() = "TRC" OrElse TXT_requesttype.Text.ToUpper() = "TCC" OrElse TXT_requesttype.Text.ToUpper() = "TIC" Then
                        lblError.Text = Nothing

                        response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                            TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                            TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_CardHolderName.Text, TXT_CardNumber.Text, _
                            TXT_ExpiryMonth.Text, TXT_ExpiryYear.Text, TXT_CVV.Text, TXT_CardID.Text, TXT_IsKey.Text, TXT_IsIv.Text)
                    ElseIf TXT_requesttype.Text.ToUpper() = "TWI" OrElse TXT_requesttype.Text.ToUpper() = "TIO" Then
                        lblError.Text = Nothing

                        response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                            TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                            TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_MMID.Text, TXT_RegisteredMobileNumber.Text, _
                            TXT_OTP.Text, TXT_IsKey.Text, TXT_IsIv.Text)
                    Else
                        lblError.Text = Nothing
                        objRequestURL.strProxyAuthReq = "Y"
                        objRequestURL.strProxyAddress = "http://10.10.100.8:8000/"
                        objRequestURL.strUserName = "74390"
                        objRequestURL.strPassword = "jul@2015"
                        objRequestURL.strIgnoreSSL = "Y"



                        response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                            TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                            TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_CardID.Text, TXT_IsKey.Text, _
                            TXT_IsIv.Text)
                    End If
                End If

                Dim strResponse As [String] = response__1.ToUpper()

                Dim IsValid As Boolean = False
                Dim Count As Integer = 3
                For i As Integer = 0 To Count - 1
                    If strResponse.StartsWith("ERROR") Then
                        If strResponse = "ERROR073" Then
                            IsValid = False
                            If ddlRequest.SelectedValue = "1" Then
                                'if (ddlRequestType.SelectedValue == "0")
                                '{
                                '    lblError.Text = "Please Select Request Type";
                                '}
                                'else
                                '{
                                lblError.Text = Nothing
                                response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                                    TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                                    TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_propertyPath.Text)
                                ' }
                                strResponse = response__1.ToUpper()
                            Else
                                'if (ddlRequestType.SelectedValue == "0")
                                '{
                                '    lblError.Text = "Please Select Request Type";
                                '}
                                'else
                                '{
                                lblError.Text = Nothing
                                response__1 = objRequestURL.SendRequest(TXT_requesttype.Text, TXT_merchantcode.Text, TXT_MerchantTxnRefNo.Text, TXT_ITC.Text, TXT_Amount.Text, TXT_Currencycode.Text, _
                                    TXT_uniqueCustomerID.Text, TXT_returnURL.Text, TXT_StoSreturnURL.Text, TXT_TPSLTXNID.Text, TXT_Shoppingcartdetails.Text, TXT_TxnDate.Text, _
                                    TXT_Email.Text, TXT_mobileNo.Text, TXT_Bankcode.Text, TXT_customerName.Text, TXT_CardID.Text, TXT_IsKey.Text, _
                                    TXT_IsIv.Text)
                            End If
                            ' }

                            strResponse = response__1.ToUpper()
                        Else
                            lblResponse.Text = response__1
                            Exit For
                        End If
                    Else
                        IsValid = True
                        Exit For
                    End If
                Next

                If TXT_requesttype.Text.Trim() = "T" OrElse TXT_requesttype.Text.Trim() = "TNR" OrElse TXT_requesttype.Text.Trim() = "TCI" OrElse TXT_requesttype.Text.Trim() = "TWC" OrElse TXT_requesttype.Text.Trim() = "TRC" OrElse TXT_requesttype.Text.Trim() = "TCC" OrElse TXT_requesttype.Text.Trim() = "TIC" Then
                    If IsValid Then
                        Session("Merchant_Code") = TXT_merchantcode.Text
                        If ddlRequest.SelectedValue = "1" Then
                            Session("PropertyFile") = TXT_propertyPath.Text
                        Else
                            Session("IsKey") = TXT_IsKey.Text
                            Session("IsIv") = TXT_IsIv.Text
                        End If
                        Response.Write("<form name='s1_2' id='s1_2' action='" & response__1 & "' method='post'> ")
                        Response.Write("<script type='text/javascript' language='javascript' >document.getElementById('s1_2').submit();")
                        Response.Write("</script>")
                        Response.Write("<script language='javascript' >")
                        Response.Write("</script>")
                        Response.Write("</form> ")

                    End If
                ElseIf TXT_requesttype.Text = "R" Then
                    lblResponse.Text = response__1

                    If response__1 = "" Then
                        lblResponse.Text = "Transaction Fail " & "ERROR:"
                    Else
                        lblResponse.Text = response__1
                    End If
                ElseIf TXT_requesttype.Text = "TWI" Then
                    Session("Merchant_Code") = TXT_merchantcode.Text
                    If ddlRequest.SelectedValue = "1" Then
                        Session("PropertyFile") = TXT_propertyPath.Text
                    Else
                        Session("IsKey") = TXT_IsKey.Text
                        Session("IsIv") = TXT_IsIv.Text
                    End If

                    Dim strArrResponse As String() = response__1.Split("&"c)
                    Dim strMsg As String = strArrResponse(0).Replace("msg=", "")
                    Response.Write("<form name='s1_2' id='s1_2' action='ResponsePage.aspx' method='post'> ")
                    Response.Write("<input type='hidden' name='msg' value='" & strMsg & "'>")
                    Response.Write("<script type='text/javascript' language='javascript' >document.getElementById('s1_2').submit();")
                    Response.Write("</script>")
                    Response.Write("<script language='javascript' >")
                    Response.Write("</script>")
                    Response.Write("</form> ")
                Else
                    If response__1 = "" Then
                        lblResponse.Text = "Transaction Fail " & "ERROR:"
                    Else
                        lblResponse.Text = response__1
                    End If


                End If

                'if (strResponse.StartsWith("ERROR"))
                '{
                '    lblError.Text = response;
                '}
                'else
                '{
                '    if (TXT_requesttype.Text == "T")
                '    {

                '        Response.Write("<form name='s1_2' id='s1_2' action='" + response + "' method='post'> ");
                '        Response.Write("<script type='text/javascript' language='javascript' >document.getElementById('s1_2').submit();");
                '        Response.Write("</script>");
                '        Response.Write("<script language='javascript' >");
                '        Response.Write("</script>");
                '        Response.Write("</form> ");

                '    }
                '    else if (TXT_requesttype.Text == "R")
                '    {
                '        lblResponse.Text = response;

                '        if (response == "")
                '        {
                '            lblResponse.Text = "Transaction Fail " + "ERROR:";
                '        }
                '        else
                '        {
                '            lblResponse.Text = response;
                '        }
                '    }
                '    else
                '    {
                '        if (response == "")
                '        {
                '            lblResponse.Text = "Transaction Fail " + "ERROR:";
                '        }
                '        else
                '        {
                '            lblResponse.Text = response;
                '        }
                '    }
                '}
            End If
        Catch generatedExceptionName As Exception

            Throw
        End Try
    End Sub

    Protected Sub ddlRequest_SelectedIndexChanged(sender As Object, e As EventArgs)
        lblError.Text = Nothing
        lblResponse.Text = Nothing
        If ddlRequest.SelectedValue <> "0" Then
            If ddlRequest.SelectedValue = "1" Then
                trKey.Visible = False
                trIv.Visible = False
                trProprty.Visible = True
            Else
                trKey.Visible = True
                trIv.Visible = True
                trProprty.Visible = False
            End If
        Else
            trKey.Visible = False
            trIv.Visible = False
            trProprty.Visible = False
        End If
    End Sub

    'protected void ddlRequestType_SelectedIndexChanged(object sender, EventArgs e)
    '{
    '    lblError.Text = null;
    '    lblResponse.Text = null;
    '    if (ddlRequestType.SelectedValue != "0")
    '    {
    '        if (ddlRequestType.SelectedValue == "6")
    '        {
    '            trCardId.Visible = true;
    '        }
    '        else
    '        {
    '            trCardId.Visible = false;
    '        }
    '    }
    '    else
    '    {
    '        trCardId.Visible = false;
    '    }
    '}
End Class