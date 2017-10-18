<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="betatesting._default7" %>

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
                <asp:TextBox ID="txthscountry" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>State</div>
            <div>
                <asp:Label ID="lblhsstate" runat="server" Text="State"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsstate" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>HeadQuarter</div>
            <div>
                <asp:Label ID="lblhsheadquater" runat="server" Text="HeadQuarter"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsheadquater" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>SubArea</div>
            <div>
                <asp:Label ID="lblhssubarea" runat="server" Text="SubArea"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthssubarea" runat="server" Visible="false"></asp:TextBox>
            </div>
            <div>Division</div>
            <div>
                <asp:Label ID="lblhsdivision" runat="server" Text="Division"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txthsdivision" runat="server" Visible="false"></asp:TextBox>
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
                <asp:TextBox ID="txthstherapatic" runat="server" Visible="false"></asp:TextBox>
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
                <asp:TextBox ID="txthszone" runat="server" Visible="false"></asp:TextBox>
            </div>
            

        </div>
    </form>
</body>
</html>
