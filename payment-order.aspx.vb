Imports InstamojoAPI
Imports System.Windows.Forms
Imports System.IO
Imports System.Net
Public Class payment_order
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objClass = InstamojoImplementation.getApi("ws5brypVTsOGVIw5SdV9WTxIdOpdYaRIZzf7TMXV", "yXnpR888z0etdlUGZNAMX5hinXHdMTi3lEvk9AAcCvmrkRzH030tCOw7Aw0XPAVcs6WvlRdpq8RuAK7TJXR1WWVG28uqSJRq1MiyDTpAzSJM0DFTchKNqnFSxhDmHG3J", "https://api.instamojo.com/v2/", "https://www.instamojo.com/oauth2/token/")


        'Try
        '    Dim objPaymentOrderListRequest As New PaymentOrderListRequest()
        '    'Optional Parameters
        '    objPaymentOrderListRequest.limit = 20
        '    objPaymentOrderListRequest.page = 3

        '    Dim objPaymentRequestStatusResponse As PaymentOrderListResponse = objClass.getPaymentOrderList(objPaymentOrderListRequest)
        '    MessageBox.Show("Order Count = " + objPaymentRequestStatusResponse.orders.Count())
        'Catch ex As Exception
        '    MessageBox.Show("Error:" + ex.Message)
        'End Try

        lbltransactionresponse.Text = Request("transaction_id")

        Try
            Dim objPaymentRequestDetailsResponse As PaymentOrderDetailsResponse = objClass.getPaymentOrderDetailsByTransactionId(lbltransactionresponse.Text)



            lbltransactionamount.Text = objPaymentRequestDetailsResponse.amount

            lblcreatedat.Text = objPaymentRequestDetailsResponse.created_at

            lblcurrency.Text = objPaymentRequestDetailsResponse.currency

            lbldescription.Text = objPaymentRequestDetailsResponse.description

            lblemail.Text = objPaymentRequestDetailsResponse.email

            lblid.Text = objPaymentRequestDetailsResponse.id

            lblname.Text = objPaymentRequestDetailsResponse.name


            

            lblphone.Text = objPaymentRequestDetailsResponse.phone

            lblstatus.Text = objPaymentRequestDetailsResponse.status

            lbltransactionresponse.Text = objPaymentRequestDetailsResponse.transaction_id

            Dim paymentstest As String

            paymentstest = objPaymentRequestDetailsResponse.payments
            lblpayments.Text = paymentstest

        Catch ex As Exception
            Label1.Text = ("Error:" + ex.Message)
        End Try

        lblorderresponse.Text = Request("ID")

        Try
            Dim objPaymentRequestDetailsResponse As PaymentOrderDetailsResponse = objClass.getPaymentOrderDetails(lblorderresponse.Text)

            lblorderresponse.Text = ("Transaction Id  = " + objPaymentRequestDetailsResponse.transaction_id)

            lbltransactionamount2.Text = objPaymentRequestDetailsResponse.amount

            lblcreatedat2.Text = objPaymentRequestDetailsResponse.created_at

            lblcurrency2.Text = objPaymentRequestDetailsResponse.currency

            lbldescription2.Text = objPaymentRequestDetailsResponse.description

            lblemail2.Text = objPaymentRequestDetailsResponse.email

            lblid2.Text = objPaymentRequestDetailsResponse.id

            lblname2.Text = objPaymentRequestDetailsResponse.name




            lblphone2.Text = objPaymentRequestDetailsResponse.phone

            lblstatus2.Text = objPaymentRequestDetailsResponse.status

            lbltransactionresponse2.Text = objPaymentRequestDetailsResponse.transaction_id

            Dim paymentstest2 As Integer

            paymentstest2 = objPaymentRequestDetailsResponse.payments
            lblpayments2.Text = paymentstest2



        Catch ex As Exception
            Label2.Text = ("Error:" + ex.Message)
        End Try





        Try
            Dim objPaymentOrderListRequest As New PaymentOrderListRequest()
            'Optional Parameters
            objPaymentOrderListRequest.limit = 20
            objPaymentOrderListRequest.page = 3

            Dim objPaymentRequestStatusResponse As PaymentOrderListResponse = objClass.getPaymentOrderList(objPaymentOrderListRequest)


            Dim ordercounttotal As String

            ordercounttotal = objPaymentRequestStatusResponse.orders.Count


            lblordercount.Text = ("Order Count = " + ordercounttotal)
        Catch ex As Exception
            lblordercount.Text = ("Error:" + ex.Message)
        End Try

    End Sub

End Class