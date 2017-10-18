Imports InstamojoAPI
Imports System.Windows.Forms
Imports System.IO
Imports System.Net

Public Class PaymentTest
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim objClass = InstamojoImplementation.getApi("ws5brypVTsOGVIw5SdV9WTxIdOpdYaRIZzf7TMXV", "yXnpR888z0etdlUGZNAMX5hinXHdMTi3lEvk9AAcCvmrkRzH030tCOw7Aw0XPAVcs6WvlRdpq8RuAK7TJXR1WWVG28uqSJRq1MiyDTpAzSJM0DFTchKNqnFSxhDmHG3J", "https://api.instamojo.com/v2/", "https://www.instamojo.com/oauth2/token/")




        Dim objPaymentRequest As New PaymentOrder()
        'Required POST parameters
        objPaymentRequest.name = "ABCD"
        objPaymentRequest.email = "foo@example.com"
        objPaymentRequest.phone = "9969156561"
        objPaymentRequest.description = "Test description"
        objPaymentRequest.amount = "9"
        objPaymentRequest.currency = "USD"

        Dim randomName As String = Path.GetRandomFileName()
        randomName = randomName.Replace(".", String.Empty)
        objPaymentRequest.transaction_id = Convert.ToString("test") & randomName
        'objPaymentRequest.transaction_id = "1234567890"

        objPaymentRequest.redirect_url = "http://mokshamedia.in/payment-order.aspx"
        objPaymentRequest.webhook_url = "http://mokshamedia.in/default.aspx"
        'Extra POST parameters 

        If objPaymentRequest.validate() Then
            If objPaymentRequest.emailInvalid Then
                MessageBox.Show("Email is not valid")
            End If
            If objPaymentRequest.nameInvalid Then
                MessageBox.Show("Name is not valid")
            End If
            If objPaymentRequest.phoneInvalid Then
                MessageBox.Show("Phone is not valid")
            End If
            If objPaymentRequest.amountInvalid Then
                MessageBox.Show("Amount is not valid")
            End If
            If objPaymentRequest.currencyInvalid Then
                MessageBox.Show("Currency is not valid")
            End If
            If objPaymentRequest.transactionIdInvalid Then
                MessageBox.Show("Transaction Id is not valid")
            End If
            If objPaymentRequest.redirectUrlInvalid Then
                MessageBox.Show("Redirect Url Id is not valid")
            End If
            If objPaymentRequest.webhookUrlInvalid Then
                MessageBox.Show("Webhook URL is not valid")

            End If
        Else
            Try
                Dim objPaymentResponse As CreatePaymentOrderResponse = objClass.createNewPaymentRequest(objPaymentRequest)
                'MessageBox.Show("Payment URL = " + objPaymentResponse.payment_options.payment_url)


                Dim redirecturl As String


                redirecturl = objPaymentResponse.payment_options.payment_url

                Response.Redirect(redirecturl)


            Catch ex As ArgumentNullException
                MessageBox.Show(ex.Message)
            Catch ex As WebException
                MessageBox.Show(ex.Message)
            Catch ex As IOException
                MessageBox.Show(ex.Message)
            Catch ex As InvalidPaymentOrderException
                If Not ex.IsWebhookValid() Then
                    MessageBox.Show("Webhook is invalid")
                End If

                If Not ex.IsCurrencyValid() Then
                    MessageBox.Show("Currency is Invalid")
                End If

                If Not ex.IsTransactionIDValid() Then
                    MessageBox.Show("Transaction ID is Inavlid")
                End If
            Catch ex As ConnectionException
                MessageBox.Show(ex.Message)
            Catch ex As BaseException
                MessageBox.Show(ex.Message)
            Catch ex As Exception
                MessageBox.Show("Error:" + ex.Message)
            End Try
        End If
    End Sub

   
    Private Shared Sub CreatePaymentOrder(objClass As Instamojo)
       
    End Sub

End Class