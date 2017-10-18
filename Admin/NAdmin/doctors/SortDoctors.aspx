<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="SortDoctors.aspx.vb" Inherits="KimsHospitals.SortDoctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr class="HeaderStyle" ><td>Branch</td>
            <td>Institute</td>
            <td>Department</td>
            <td>Specialisation</td>
        </tr>
        <tr class="RowStyle"><td>
            <asp:DropDownList ID="DdlBranch" runat="server" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
            <asp:DropDownList ID="DdlInstitute" runat="server" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
            <asp:DropDownList ID="DdlDepartment" runat="server" AutoPostBack="True"></asp:DropDownList>
            </td>
            <td>
            <asp:DropDownList ID="DdlSpeciality" runat="server" AutoPostBack="True"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td valign="top"><asp:GridView ID="GVBranchDoctors" runat="server"  ForeColor="Black" BorderStyle="Solid" 
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="DOCTORID" 
                                AllowPaging="True" PageSize="15" AutoGenerateEditButton="True" >
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:BoundField DataField="DOCTORID" HeaderText="DOCTORID" ReadOnly="True" SortExpression="DOCTORID" Visible="False" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" ReadOnly="True" />
                        <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate><%# Eval("SortOrder") %></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblSortorder" runat="server" Text='<%# Eval("SortOrder") %>' Visible="False"></asp:Label>
                                        <asp:DropDownList ID="DdlBranchOrder" runat="server" ></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px"></RowStyle>
                    <HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
                </asp:GridView>
            </td>
            <td valign="top"><asp:GridView ID="GVInstituteDoctors" runat="server"  ForeColor="Black" BorderStyle="Solid" 
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="DOCTORID" 
                                AllowPaging="True" PageSize="15" AutoGenerateEditButton="True" >
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:BoundField DataField="DOCTORID" HeaderText="DOCTORID" ReadOnly="True" SortExpression="DOCTORID" Visible="False" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                        <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate><%# Eval("SortOrder") %></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblSortorder" runat="server" Text='<%# Eval("SortOrder") %>' Visible="False"></asp:Label>
                                        <asp:DropDownList ID="DdlInstituteOrder" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px"></RowStyle>
                    <HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
                </asp:GridView>
            </td>
            <td valign="top"><asp:GridView ID="GVDeptDoctors" runat="server"  ForeColor="Black" BorderStyle="Solid" 
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="DOCTORID" 
                                AllowPaging="True" PageSize="15" AutoGenerateEditButton="True" >
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:BoundField DataField="DOCTORID" HeaderText="DOCTORID" ReadOnly="True" SortExpression="DOCTORID" Visible="False" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                        <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate><%# Eval("SortOrder") %></ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblSortorder" runat="server" Text='<%# Eval("SortOrder") %>' Visible="False"></asp:Label>
                                        <asp:DropDownList ID="DdlDeptOrder" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px"></RowStyle>
                    <HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
                </asp:GridView>
            </td>
            <td valign="top"><asp:GridView ID="GVSpecilisationDoctors" runat="server"  ForeColor="Black" BorderStyle="Solid" 
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="DOCTORID" 
                                AllowPaging="True" PageSize="15" >
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns><asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="DOCTORID" HeaderText="DOCTORID" ReadOnly="True" SortExpression="DOCTORID" Visible="False" />
                        <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                        <asp:TemplateField ShowHeader="False">
                                   <ItemTemplate><%# Eval("SortOrder") %></ItemTemplate>
                                    <EditItemTemplate>
                                         <asp:Label ID="lblSortorder" runat="server" Text='<%# Eval("SortOrder") %>' Visible="False"></asp:Label>
                                        <asp:DropDownList ID="DdlSpecilisationOrder" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px"></RowStyle>
                    <HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
