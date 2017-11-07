<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default2.aspx.vb" Inherits="betatesting._default7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>

            <div>
                FullName
            </div>
            <div>
                <asp:Label ID="lblhsfullname" runat="server" Text="FullName"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsfullname" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                LastName

            </div>
            <div>
                <asp:Label ID="lblhslastname" runat="server" Text="LastName"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthslastname" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                EmailId

            </div>
            <div>
                <asp:Label ID="lblhsemailid" runat="server" Text="EmailId"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsemailid" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                Mobile

            </div>
            <div>
                <asp:Label ID="lblhsmobile" runat="server" Text="Mobile"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsmobile" runat="server" Visible="false"></asp:TextBox>
            </div>
     <div>
                           PlotNo

     </div>
            <div>
                <asp:Label ID="lblhsplotno" runat="server" Text="PlotNo"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsplotno" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                Address1

            </div>
            <div>
                <asp:Label ID="lblhsadressone" runat="server" Text="Address1"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsadressone" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                Address2

            </div>
            <div>
                <asp:Label ID="lblhsadresstwo" runat="server" Text="Address2"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsadresstwo" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>
                Country

            </div>
            <div>
                <asp:Label ID="lblhscountry" runat="server" Text="Country"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="DDLEnquiry_Country" runat="server" AppendDataBoundItems="true"  Visible="false" AutoPostBack="true" Width="198" >
                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                      </asp:DropDownList>
            </div>
            <div>State</div>
            <div>
                <asp:Label ID="lblhsstate" runat="server" Text="State"></asp:Label>
            </div>
            <div>
              
            
      <asp:DropDownList ID="ddlstate" runat="server"  Visible="false" AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                                              <asp:ListItem Value="0">Select State</asp:ListItem>
                      </asp:DropDownList>
       
            </div>
            <div>HeadQuarter</div>
            <div>
                <asp:Label ID="lblhsheadquater" runat="server" Text="HeadQuarter"></asp:Label>
            </div>
            <div>
               <asp:DropDownList ID="DDLCITY" runat="server"  Visible="false" AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="0">Select City</asp:ListItem>
                      </asp:DropDownList>
            </div>
            <div>SubArea</div>
            <div>
                <asp:Label ID="lblhssubarea" runat="server" Text="SubArea"></asp:Label>
            </div>
            <div>
              <asp:DropDownList ID="ddlsubcity" runat="server"  Visible="false" AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="0">Select Sub City</asp:ListItem>
                      </asp:DropDownList>
            </div>
            <div>Division</div>
            <div>
                <asp:Label ID="lblhsdivision" runat="server" Text="Division"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="ddldivision" runat="server" AppendDataBoundItems="true"  Visible="false" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="0">Select Division</asp:ListItem>
                      </asp:DropDownList>
            </div>
            <div>Cnf</div>
            <div>
                <asp:Label ID="lblhscnf" runat="server" Text="Cnf"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthscnf" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>Therapatic</div>
            <div>
                <asp:Label ID="lblhstherapatic" runat="server" Text="Therapatic"></asp:Label>
            </div>
            <div>
                 <asp:DropDownList ID="ddltherapatic" runat="server"  Visible="false" AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="0">Select Division</asp:ListItem>
                      </asp:DropDownList>
            </div>
            <div>PinCode</div>
            <div>
                <asp:Label ID="lblhspincode" runat="server" Text="PinCode"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthspincode" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>Telephone</div>
            <div>
                <asp:Label ID="lblhstelephone" runat="server" Text="Telephone"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthstelephone" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>Fax</div>
            <div>
                <asp:Label ID="lblhsfax" runat="server" Text="Fax"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsfax" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>GstProvisionalId</div>
            <div>
                <asp:Label ID="lblhsgstprovisionalid" runat="server" Text="GstProvisionalId"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsgstprovisionalid" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>Pan</div>
            <div>
                <asp:Label ID="lblhspan" runat="server" Text="Pan"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthspan" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>SpocName</div>
            <div>
                <asp:Label ID="lblhsspocname" runat="server" Text="SpocName"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsspocname" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>SpocMobile</div>
            <div>
                <asp:Label ID="lblhsspocmobile" runat="server" Text="SpocMobile"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsspocmobile" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>SsisStatus</div>
            <div>
                <asp:Label ID="lblhsssistatus" runat="server" Text="SsisStatus"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsssistatus" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>DrugLicenseNo</div>
            <div>
                <asp:Label ID="lblhsdruglicenceno" runat="server" Text="DrugLicenseNo"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsdruglicenceno" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>Zone</div>
            <div>
                <asp:Label ID="lblhszone" runat="server" Text="Zone"></asp:Label>
            </div>
            <div>
                <div>

                </div>
                <asp:TextBox ID="txthszone" runat="server" Visible="false"></asp:TextBox>
                </div>
                



        <div>

            <div>Edit</div>
            <div>
                <asp:Button ID="btnedit" runat="server" Text="Edit" />


            </div>
        </div>
    </form>
</body>
</html>
