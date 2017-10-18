Imports InstamojoAPI
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

Public Class page1
    Inherits System.Web.UI.Page

    'Private strHEX As String, strPGActualReponseWithChecksum As String, strPGActualReponseEncrypted As String, strPGActualReponseDecrypted As String, strPGresponseChecksum As String, strPGTxnStatusCode As String
    'Private strSplitDecryptedResponse As String(), strPGChecksum As String(), strPGTxnString As String()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objClass As New RequestURL()

        objClass = InstamojoImplementation.getApi("ws5brypVTsOGVIw5SdV9WTxIdOpdYaRIZzf7TMXV", "yXnpR888z0etdlUGZNAMX5hinXHdMTi3lEvk9AAcCvmrkRzH030tCOw7Aw0XPAVcs6WvlRdpq8RuAK7TJXR1WWVG28uqSJRq1MiyDTpAzSJM0DFTchKNqnFSxhDmHG3J", "https://api.instamojo.com/v2/", "https://www.instamojo.com/oauth2/token/")

        Dim objPaymentRequest As New PaymentOrder()
        'Required POST parameters
        objPaymentRequest.name = "ABCD"
        objPaymentRequest.email = "foo@example.com"
        objPaymentRequest.phone = "0123456789"
        objPaymentRequest.amount = 9
        objPaymentRequest.transaction_id = "test"
        ' Unique Id to be provided
        objPaymentRequest.redirect_url = redirect_url

        Try
            Dim objPaymentResponse As CreatePaymentOrderResponse = objClass.createNewPaymentRequest(objPaymentRequest)
            MessageBox.Show("Order Id = " + objPaymentResponse.order.id)
        Catch ex As Exception
            MessageBox.Show("Error:" + ex.Message)
        End Try
    End Sub

End Class