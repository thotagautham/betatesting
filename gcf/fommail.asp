<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>GLOBAL CANCER FOUNDATION</title>

</head>

<body>
<table width="260" style="height:244" border="0" align="center" cellpadding="3" cellspacing="0" bgcolor="#FFFFFF">
                    
                    <tr>
                      <td height="244"  style="padding-left:7px"><div align="center">
        <p>&nbsp;</p>
        <p class="focuspanels" style="font-family:Arial, Helvetica, sans-serif; font-size:15px; ">Thank you for your enquiry, we will get back to you as soon as possible.<br /><br /></p>
        
       
        
        
          <br />
        
                      </div></td>
                    </tr>
</table>

<% 
	message = "<font face='verdana' size='2'>Dear Admin,<br /><br />Following are the details.<br /><br/>" &_ 
	"<table width='485' border='0' cellspacing='0' cellpadding='0'>" &_
                    "<tr>" &_
                     "<td width='125' align='right' valign='middle'>Name</td>" &_
                      "<td width='20' align='center' valign='middle'>:</td>" &_
                      "<td width='310' align='left' valign='middle'>" & request("txtName") & "</td>" &_
                    "</tr>" &_
                    "<tr>" &_
                    "<td width='125' height='10' align='right' valign='middle'></td>" &_
                    "<td align='center' valign='middle'></td>" &_
                    "<td width='310' align='left' valign='middle'></td>" &_
                    "</tr>" &_
                    "<tr>" &_
					
					   "<tr>" &_
                     "<td width='125' align='right' valign='middle'>Email</td>" &_
                      "<td width='20' align='center' valign='middle'>:</td>" &_
                      "<td width='310' align='left' valign='middle'>" & request("txtEmail") & "</td>" &_
                    "</tr>" &_
                    "<tr>" &_
                    "<td width='125' height='10' align='right' valign='middle'></td>" &_
                    "<td align='center' valign='middle'></td>" &_
                    "<td width='310' align='left' valign='middle'></td>" &_
                    "</tr>" &_
                    "<tr>" &_
					
					
					
					"<tr>" &_
                    "<td width='125' align='right' valign='middle'>Enquiry</td>" &_
                    "<td align='center' valign='middle'>:</td>" &_
                    "<td width='310' align='left' valign='middle'>" & request("txtEnquiry") & "</td>" &_
                    "</tr></table></font>"
                    
			

	Set objCDOSYSMail = Server.CreateObject("CDO.Message") 
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration") 
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "127.0.0.1" 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 60 
	objCDOSYSCon.Fields.Update 
	 
	Set objCDOSYSMail.Configuration = objCDOSYSCon 
	objCDOSYSMail.From = request("txtEmail")
objCDOSYSMail.To = "malika@mokshamedia.co.in"
	objCDOSYSMail.Bcc = "bindu@mokshamedia.co.in"
	objCDOSYSMail.Subject = "Enquiry from Global Cancer Cancer"
	objCDOSYSMail.HTMLBody =message
	objCDOSYSMail.Send 
	 
	Set objCDOSYSMail = Nothing 
	Set objCDOSYSCon = Nothing  
	
%>


</body>
</html>
