<%@ Page Title="" Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="betatesting.Admin_NAdmin_Settings_Skills" Codebehind="Skills.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 

    <div align=center>
    <asp:Label ID="LblMsg" runat="server"></asp:Label><br />
    <br />
    &nbsp;</div>
<div align=center>
    <asp:GridView ID="GridView1" runat="server"  ForeColor="Black" BorderStyle="Solid" BorderColor="#404040"  AutoGenerateColumns="False" DataKeyNames="SkillId"
        DataSourceID="DsSkills">
        <Columns>
            <asp:TemplateField HeaderText="Skill Name" SortExpression="BGVAL">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" MaxLength="100" Text='<%# Bind("SkillName") %>'></asp:TextBox><asp:RequiredFieldValidator
                        ID="RFVBG" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="Skill Name Should Not Be Empty"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SkillName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" MaxLength="1" Text='<%# Bind("Active") %>'></asp:TextBox><asp:RequiredFieldValidator
                        ID="RFVActive" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Enter [Y/N] "></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="REVActive" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Active Status Should be [Y/N] "
                            ValidationExpression="[YNyn]"></asp:RegularExpressionValidator><asp:ValidationSummary
                                ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Active") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Columns>
        <RowStyle Height="30px"></RowStyle>

<HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
    </asp:GridView>
    <asp:ObjectDataSource ID="DsSkills" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllData" TypeName=" betatesting.DataSetCareTableAdapters.SkillsTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SkillId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="SkillName" Type="String" />
            <asp:Parameter Name="Active" Type="String" />
            <asp:Parameter Name="Original_SkillId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="SkillName" Type="String" />
            <asp:Parameter Name="Active" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    </div>

</asp:Content>

