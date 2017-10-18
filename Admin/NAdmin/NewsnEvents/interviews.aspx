<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="interviews.aspx.vb" Inherits="KimsHospitals.interviews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div align="center">
        <table>
 <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>

 <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Title</td>
                <td><asp:TextBox ID="txtTitle" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
 </tr>
          
              
 <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Description</td>
                <td><asp:TextBox ID="txtDescription" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
</tr>


 <tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Date</td>
        <td align="left">
        <asp:TextBox ID="TxtDate" runat="server" ></asp:TextBox><asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="false"></asp:ImageButton>
        <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
            ControlToValidate="TxtDate" Display="None" ErrorMessage="Enter News Date" 
            ValidationGroup="VgSave"></asp:RequiredFieldValidator>
        <BR /><cc1:calendarextender id="CalendarExtender1" runat="server" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:calendarextender>
        </td>

  </tr>

            
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Visible Date </td>
                <td><asp:TextBox ID="txtsize" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Patient Name</td>
                <td><asp:TextBox ID="txtpatientname" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>


            </tr>

            <tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Paper</td><td align="left">
        <asp:DropDownList ID="DDLNewsPapers" runat="server" AppendDataBoundItems="True">
        </asp:DropDownList>
        </td></tr>


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
                <td valign="top" class="tdStyle">I frame url</td>
                <td><asp:TextBox ID="txtiframeurl" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
                </td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Target url</td>
                <td><asp:TextBox ID="txtnavagationpathurl" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
                </td>
       

            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Alternate Text</td>
                <td><asp:TextBox ID="txtAlternateText" runat="server" TextMode="MultiLine" Rows="2" Columns="50"></asp:TextBox></td>
            </tr>
            
             

<
         

     

          
           
           
           
           
            
            
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