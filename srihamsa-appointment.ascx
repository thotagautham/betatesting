<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="srihamsa-appointment.ascx.vb" Inherits="betatesting.srihamsa_appointment" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

 <script type="text/javascript">
     //disable sunday
     function detect_sunday(sender, args) {
         if (sender._selectedDate.getDay() == 0) {
             sender._selectedDate = new Date();
             // set the date back to the current date
             sender._textbox.set_Value(sender._selectedDate.format(sender._format));
             alert("You can't select sunday!");
         }
     }
    </script>




    <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet"
        type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script language="javascript">
        $(document).ready(function () {
            $("#txtdate1").datepicker({
                minDate: 1,
                maxDate: 90,
                beforeShowDay: noSunday
            });
            function noSunday(date) {
                var day = date.getDay();
                return [(day > 0), ''];
            };
        });
    </script>
<asp:TextBox ID="TxtName" runat="server" MaxLength="50" CssClass="form-control" Text="Type Name*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Name*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Name*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                        
                        
                        
                        
  <asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"  CssClass="form-control" Text="Type Email*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Email*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Email*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry" InitialValue="Type Email*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>
                    
                    
                    
<asp:TextBox id="TxtTelephone"  runat="server" Text="Type Mobile Number*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Mobile Number*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Mobile Number*' : Trim(this);" CssClass="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RFVMobile" runat="server" 
                  ControlToValidate="TxtTelephone" Display="None" ErrorMessage="Please Enter Mobile Number" 
                  ValidationGroup="VGEnquiry" InitialValue="Type Mobile Number*"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="REVMobile" runat="server" 
                  ControlToValidate="TxtTelephone" Display="None" 
                  ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]*" 
                  ValidationGroup="VGEnquiry"></asp:RegularExpressionValidator> 
                  
                  
                  

<asp:TextBox ID="TxtCountry" runat="server" MaxLength="50" CssClass="form-control" Text="Type Country*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Country*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Country*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVCountry" runat="server" 
                        ControlToValidate="TxtCountry" ErrorMessage="Type Country" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Country*"> </asp:RequiredFieldValidator>   
                        
                        
                        
 <asp:TextBox ID="TxtState" runat="server" MaxLength="50" CssClass="form-control" Text="Type State*" autocomplete="off" onfocus="Trim(this);this.value == 'Type State*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type State*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVState" runat="server" 
                        ControlToValidate="TxtState" ErrorMessage="Type Country" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type State*"> </asp:RequiredFieldValidator>  
                        
                        
      <asp:TextBox ID="AppointmentDate" runat="server"></asp:TextBox> 
      <%-- <asp:TextBox id="AppointmentDate"  runat="server"></asp:TextBox>
                <asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton>
                      <cc1:calendarextender id="CalendarExtender1" runat="server" PopupButtonID="Image1" 
                  TargetControlID="AppointmentDate" onclientdateselectionchanged="checkDate"></cc1:calendarextender>--%>
                      <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
                  ControlToValidate="AppointmentDate" Display="None" 
                  ErrorMessage="Please Enter Appointment Date" ValidationGroup="Appointment"></asp:RequiredFieldValidator>
                      <asp:CompareValidator ID="CVCheckInDate" runat="server" 
                        ErrorMessage="Invalid Check In Date" ControlToValidate="AppointmentDate" 
                        Display="None" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                        
                        
                                                              
<asp:TextBox ID="TxtComments" runat="server" Rows="2" TextMode="MultiLine" Columns="25" Text="Type Message" CssClass="form-control" autocomplete="off" onfocus="Trim(this);this.value == 'Type Message' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Message' : Trim(this);" ></asp:TextBox >
        <asp:RequiredFieldValidator ID="RFVComments" runat="server" ControlToValidate="TxtComments" Display="None" ValidationGroup="VGEnquiry" ErrorMessage="Enter Comments" InitialValue="Type Message"></asp:RequiredFieldValidator>                                     





 <asp:Button ID="btnSave" runat="server" Text="SUBMIT" ValidationGroup="VGEnquiry"  CssClass="btn btn-default center-block submit" />
      
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />

