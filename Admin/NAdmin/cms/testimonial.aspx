<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="testimonial.aspx.vb" Inherits="betatesting.testimonial" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div align="center">
        <table>
            <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>

 <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">type</td>
                <td><asp:TextBox ID="txttype" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>


              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Title</td>
                <td><asp:TextBox ID="txtTitle" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> EXPERIENCE Description

                </td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtpagedescription" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>

             </TR>
          
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Video Name</td>
                <td><asp:TextBox ID="txtVideoName" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Description</td>
                <td><asp:TextBox ID="txtDescription" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Patient Name</td>
                <td><asp:TextBox ID="txtpatientname" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
           
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">I frame url</td>
                <td><asp:TextBox ID="txtiframeurl" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
                </td>
            </tr>
            <tr class="RowStyle"><td align="left" class="tdStyle">Thumbnail image</td><td align="left">
                               <asp:FileUpload ID="FUNewsImage" runat="server" />
           <asp:CustomValidator ID="CheckInstituteDepartment" ClientValidationFunction="ValidateInstituteDepartment" runat="server" 
                        ErrorMessage="Please Enter Iframe Url or Upload a image" 
                        Display="None"></asp:CustomValidator>
                        <script language="javascript" type="text/javascript">

                            function ValidateInstituteDepartment(source, args) {
                                var lstdept = document.getElementById('<%= txtiframeurl.ClientID%>');

                                var lstinstitute = document.getElementById('<%= FUNewsImage.ClientID%>');

                                var i;
                                var valselected;
                                valselected = false;

                                for (i = 0; i < lstdept.length; i++) {
                                    if (lstdept.options[i].selected) {
                                        valselected = true;
                                        i = lstdept.length;
                                    }
                                }

                                if (valselected == false) {
                                    for (i = 0; i < lstinstitute.length; i++) {
                                        if (lstinstitute.options[i].selected) {
                                            valselected = true;
                                            i = lstinstitute.length;
                                        }
                                    }
                                }

                                args.IsValid = valselected;

                            }
</script> 
        </td></tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Target url</td>
                <td><asp:TextBox ID="txtnavagationpathurl" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
                </td>
            </tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Upload File</td>
                <td><asp:FileUpload ID="FUDocument" runat="server" />
                    <asp:HyperLink ID="Hlfile" Target ="_blank" runat="server"></asp:HyperLink> </td>
            </tr>
       <%--<tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Date</td>
        <td align="left">
        <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox><asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton>
        <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
            ControlToValidate="TxtDate" Display="None" ErrorMessage="Enter News Date" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        <BR /><cc1:calendarextender id="CalendarExtender" runat="server" __designer:wfdid="w5" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:calendarextender>
        </td></tr>--%>

            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Alternate Text</td>
                <td><asp:TextBox ID="txtAlternateText" runat="server" TextMode="MultiLine" Rows="2" Columns="50"></asp:TextBox></td>
            </tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Sort Order</td>
                <td><asp:TextBox ID="txtSortOrder" runat="server" MaxLength="2"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RevSortOrder" runat="server" ErrorMessage="Sort Order :: Enter Numbers Only" ControlToValidate="txtSortOrder" ValidationExpression="[0-9]" Display="None" ValidationGroup="VgSave"></asp:RegularExpressionValidator>
                </td>
            </tr>
             

<%--              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Posted By Doctor</td>
                <td><asp:TextBox ID="txtPostedByDoctorID" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>--%>
         

               <tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Date</td>
        <td align="left">
        <asp:TextBox ID="TxtDate" runat="server" ></asp:TextBox><asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="false"></asp:ImageButton>
        <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
            ControlToValidate="TxtDate" Display="None" ErrorMessage="Enter News Date" 
            ValidationGroup="VgSave"></asp:RequiredFieldValidator>
        <BR /><cc1:calendarextender id="CalendarExtender1" runat="server" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:calendarextender>
        </td></tr>
          

              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Visible Date </td>
                <td><asp:TextBox ID="txtsize" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
           
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Branch</td>
                <td><asp:ListBox ID="lbBranch" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Institute</td>
                <td><asp:ListBox ID="lbInstitute" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Department</td>
                <td><asp:ListBox ID="lbDepartment" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Specialty</td>
                <td><asp:ListBox ID="lbSpecialty" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
           <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Doctors</td>
                <td><asp:ListBox ID="lbdoctor" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>  

            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Page Title</td>
                <td><asp:TextBox ID="txtpagetittle" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Keywords</td>
                <td><asp:TextBox ID="txtkeywords" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">meta tags</td>
                <td><asp:TextBox ID="txtmetatags" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Page description </td>
                <td><asp:TextBox ID="txtpagedes" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
           
           
            
            
            <tr class="AlternateRowStyle">
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="VgSave" /> &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VgSave"  ShowMessageBox="True" />
                    <asp:CustomValidator ID="CVsection" runat="server" ClientValidationFunction="checkPageSelection" Display="None" ErrorMessage="Enter Page url/Section or select any Branch/Institute/Department/Speciality" ValidationGroup="VgSave"></asp:CustomValidator>
                </td>
            </tr>
            <tr><td colspan="2">
                    <asp:GridView ID="GVAddVideo" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="DoctorVideoID" CellPadding="10">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
            <%--                    <a href='/BannerImages/<%# Eval("ImagePath") %>'  target="_blank">View Image</a> &nbsp;|--%>
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("DoctorVideoID") %>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("DoctorVideoID") %>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="Title" HeaderText="Title" 
                            SortExpression="Title" />
                        <asp:BoundField DataField="VideoName" HeaderText="VideoName" 
                            SortExpression="VideoName" />
                        <asp:BoundField DataField="SortOrder" HeaderText="Sort Order" 
                            SortExpression="SortOrder" />
                        <asp:BoundField DataField="AlternateText" HeaderText="Alternate Text" 
                            SortExpression="AlternateText" />
                         <asp:BoundField DataField="iframeurl" HeaderText="iframeurl " 
                            SortExpression="iframeurl" />
                        
                    </Columns>
                </asp:GridView>    
                </td></tr>
        </table>
    </div>
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
    <script language="javascript">
        function checkPageSelection(source, args) {

            var ddlBranch = document.getElementById('<%= lbBranch.ClientID%>');
            var ddlInstitute = document.getElementById('<%= lbInstitute.ClientID%>');
            var ddlDepartment = document.getElementById('<%= lbDepartment.ClientID%>');
            var ddlSpeciality = document.getElementById('<%= lbSpecialty.ClientID%>');
            var ddldoctor = document.getElementById('<%= lbdoctor.ClientID%>');

            args.IsValid = (txtPageUrl.value != "" || getSelectedItemsCount(ddlBranch) > 0 || getSelectedItemsCount(ddlInstitute) > 0 || getSelectedItemsCount(ddlDepartment) > 0 || getSelectedItemsCount(ddlSpeciality) > 0 || txtSection.value != "");
        }

        function getSelectedItemsCount(lb) {
            for (var i = 0; i < lb.length; i++) {
                if (lb.options[i].selected) {
                    return 1;
                }
            }
            return 0;
        }

    </script>


</asp:Content>
