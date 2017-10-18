<%@ Page Title="" Language="vb" AutoEventWireup="false"  EnableEventValidation ="true" CodeBehind="default.aspx.vb" Inherits="betatesting._default29" %>


 
<%@ Register TagName="Header" TagPrefix="H" Src="~/header.ascx" %>
<%@ Register TagName="Footer" TagPrefix="F" Src="~/footer.ascx" %>
<%@ Register TagName="Right" TagPrefix="R" Src="~/rightarea.ascx" %>




<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
        <link rel="stylesheet" type="text/css" href="../resources/css/responsive-style.css">
        <!--<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">-->
        <!--<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-theme.min.css">-->
        
        <link data-require="bootstrap@*" data-semver="3.2.0" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css" />
    <link data-require="bootstrap-css@*" data-semver="3.2.0" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.2.0" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.js"></script>
    <script data-require="angular.js@*" data-semver="1.3.0" src="//code.angularjs.org/1.3.0/angular.js"></script>
    <script data-require="jquery@*" data-semver="2.1.1" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    
        <!--<script src="resources/js/jquery.min.js"></script>-->
        <!--<script src="resources/js/bootstrap.js"></script>-->
		<!--<script src="resources/js/bootstrap.min.js"></script>
        <script src="resources/js/jquery-latest.min.js"></script>-->
		
        <!--<script src="resources/js/angular.min.js"></script>-->
     
      
        
        
        
        <!-- script for angular starts here-->
        <script>
            var app = angular.module('myApp', []);

            app.controller('vmokshaNgCtrl', ['$scope', function ($scope) {


                /* $scope.user=[
								  {"fname":""},
								  {"lname":""},
								  {"email":""},
								  {"mobile":""},
								  {"password":""},
								  {"verifyPassword":""},
								  {"comments":""}
					  ];*/

                /* $scope.submitDetails = function() {
                   
                   if(!angular.equals($scope.password, $scope.verifyPassword)) {
                   alert("passwords mismatch !");
                  }
                 };
                 */

                /* $scope.checkPassword = function() {
                   $scope.frm.verifyPassword.$error.dontMatch = $scope.password !== $scope.verifyPassword;
                 };
*/
            }]);
 		 </script>
		
        <!-- script for angular ends here -->
        
        <style>
			
				 input.ng-invalid.ng-dirty {
					border:1px solid red;
				}
				.table {
				  	border:2px solid black;
				}
				
				.modal {
					  background: #fff;
					  width: 25%;
					  height: 430px;
					  margin: auto;
					  overflow: hidden;
					  background:none;
				}
				
				.active td {
				  background: #ccc;
				}
				
				.sorted {
				  background: #ccc;
				}
				
				.ng-pristine.ng-valid-email.ng-invalid.ng-invalid-required.ng-valid-minlength.ng-valid-maxlength td{
					padding:5px;
				}
		</style>
        
       <!-- <script>
				$( document ).ready(function() {
					$(function () {
						$('#myTab a:last').tab('show');
												
					});
				});
					
		</script>-->
  
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
	
	<div>
	
	
         <H:Header runat="server" ID="Header1" />
        
    </div>
	<div class="container">
		
		<div class="col-lg-12">
			<div class="col-lg-9" style="background-color:#f0f0f0;">


                   
  <div align="center">
        <table>
            <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>

              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> NAME</td>
                <td><asp:TextBox ID="txtname" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Location / Venue </td>
                <td><asp:TextBox ID="txtlocation" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">	Remarks</td>
                <td><asp:TextBox ID="txtremarks" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">	Price</td>
                <td><asp:TextBox ID="txtprice" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
         

            <tr class="trbg2">
        <td valign="top">
            Rating </td>
        <td valign="top">
        </td>
        <td colspan="2" valign="top">
            <asp:DropDownList ID="DDLActiveStatus" runat="server">
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                 <asp:ListItem Value="3">3</asp:ListItem>
                 <asp:ListItem Value="4">4</asp:ListItem>
                 <asp:ListItem Value="5">5</asp:ListItem>
            </asp:DropDownList></td>
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

                <asp:GridView ID="GVVENDORTYPES" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="SPECIALIZATIONID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="100">
                  
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
            <%--                    <a href='/BannerImages/<%# Eval("ImagePath") %>'  target="_blank">View Image</a> &nbsp;|--%>
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("SPECIALIZATIONID")%>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("SPECIALIZATIONID")%>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="SPECIALIZATIONNAME" HeaderText="SPECIALIZATIONNAME" 
                            SortExpression="SPECIALIZATIONNAME" />
                        <asp:BoundField DataField="SPECIALIZATIONDESC" HeaderText="Location" 
                            SortExpression="SPECIALIZATIONDESC" />
                         <asp:BoundField DataField="Procedures" HeaderText="remarks" 
                            SortExpression="Procedures" />
                         <asp:BoundField DataField="Vendortype" HeaderText="Price" 
                            SortExpression="Vendortype" />
                         <asp:BoundField DataField="ratingrtype" HeaderText="Rating" 
                            SortExpression="ratingrtype" />
                        
                        
                        
                    </Columns>
                </asp:GridView>    

                <asp:Button ID="btnExport" runat="server" Text="Export To Excel" OnClick = "ExportToExcel" />  
                </td></tr>
        </table>
    </div>
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
    <script language="javascript">
        function checkPageSelection(source, args) {

            var txtname = document.getElementById('<%= txtname.ClientID%>');


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
				
			</div>
			
			
			
   			<div class="col-lg-3"> 
      
       
      			
    		</div>
		</div>
	
	</div>
	
	<div>
<F:Footer runat="server" ID="Footer1" /> 
        <%--<div></div> <p>© Think Beyond Ageing® </p></div>--%>
               
     </div>
	      
    
    </form>
</body>
