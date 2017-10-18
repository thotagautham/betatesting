Imports System
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Imaging
Imports System.Drawing.Text

Public Class CaptchaImage

    Private text As String
    Private width As Integer
    Private height As Integer
    Private familyName As String
    Public image As Bitmap
    Private random As random = New random

    Public Sub New(ByVal s As String, ByVal width As Integer, ByVal height As Integer)
        Me.text = s
        Me.SetDimensions(width, height)
        Me.GenerateImage()
    End Sub

    Public Sub New(ByVal s As String, ByVal width As Integer, ByVal height As Integer, ByVal familyName As String)
        Me.text = s
        Me.SetDimensions(width, height)
        Me.SetFamilyName(familyName)
        Me.GenerateImage()
    End Sub

    Protected Overrides Sub Finalize()
        Dispose(False)
    End Sub

    Public Sub Dispose()
        GC.SuppressFinalize(Me)
        Me.Dispose(True)
    End Sub

    Protected Overridable Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            Me.image.Dispose()
        End If
    End Sub

    Private Sub SetDimensions(ByVal width As Integer, ByVal height As Integer)
        If width <= 0 Then
            Throw New ArgumentOutOfRangeException("width", width, "Argument out of range, must be greater than zero.")
        End If
        If height <= 0 Then
            Throw New ArgumentOutOfRangeException("height", height, "Argument out of range, must be greater than zero.")
        End If
        Me.width = width
        Me.height = height
    End Sub

    Private Sub SetFamilyName(ByVal familyName As String)
        Try
            Dim font As Font = New Font(Me.familyName, 12.0F)
            Me.familyName = familyName
            font.Dispose()
        Catch generatedExceptionVariable0 As Exception
            Me.familyName = System.Drawing.FontFamily.GenericSerif.Name
        End Try
    End Sub

    Private Sub GenerateImage()
        Dim bitmap As Bitmap = New Bitmap(Me.width, Me.height, PixelFormat.Format32bppArgb)
        Dim g As Graphics = Graphics.FromImage(bitmap)
        g.SmoothingMode = SmoothingMode.AntiAlias
        Dim rect As RectangleF = New RectangleF(0, 0, Me.width, Me.height)
        Dim hatchBrush As HatchBrush = New HatchBrush(HatchStyle.SmallConfetti, Color.LightGray, Color.White)
        g.FillRectangle(hatchBrush, rect)
        Dim size As SizeF
        Dim fontSize As Long = rect.Height + 1
        Dim font As Font
        Do
            System.Math.Max(System.Threading.Interlocked.Decrement(fontSize), fontSize + 1)
            font = New Font(Me.familyName, fontSize, FontStyle.Bold)
            size = g.MeasureString(Me.text, font)
        Loop While size.Width > rect.Width
        Dim format As StringFormat = New StringFormat
        format.Alignment = StringAlignment.Center
        format.LineAlignment = StringAlignment.Center
        Dim path As GraphicsPath = New GraphicsPath
        path.AddString(Me.text, font.FontFamily, CType(font.Style, Integer), font.Size, rect, format)
        Dim v As Single = 4.0F
        Dim points As PointF() = {New PointF(Me.random.Next(rect.Width) / v, Me.random.Next(rect.Height) / v), New PointF(rect.Width - Me.random.Next(rect.Width) / v, Me.random.Next(rect.Height) / v), New PointF(Me.random.Next(rect.Width) / v, rect.Height - Me.random.Next(rect.Height) / v), New PointF(rect.Width - Me.random.Next(rect.Width) / v, rect.Height - Me.random.Next(rect.Height) / v)}
        Dim matrix As Matrix = New Matrix
        matrix.Translate(0.0F, 0.0F)
        path.Warp(points, rect, matrix, WarpMode.Perspective, 0.0F)
        hatchBrush = New HatchBrush(HatchStyle.LargeConfetti, Color.LightGray, Color.DarkGray)
        g.FillPath(hatchBrush, path)
        Dim m As Integer = Math.Max(rect.Width, rect.Height)
        Dim i As Integer = 0
        While i < CType((rect.Width * rect.Height / 30.0F), Integer)
            Dim x As Integer = Me.random.Next(rect.Width)
            Dim y As Integer = Me.random.Next(rect.Height)
            Dim w As Integer = Me.random.Next(m / 50)
            Dim h As Integer = Me.random.Next(m / 50)
            g.FillEllipse(hatchBrush, x, y, w, h)
            System.Math.Min(System.Threading.Interlocked.Increment(i), i - 1)
        End While
        font.Dispose()
        hatchBrush.Dispose()
        g.Dispose()
        Me.image = bitmap
    End Sub
End Class
