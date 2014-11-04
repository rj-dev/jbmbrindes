<%@ Control Language="C#" AutoEventWireup="true" CodeFile="categoriaDetalhes.ascx.cs" Inherits="admin_categoriaDetalhes" %>

<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<%--<table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="1" rules="none"
    style="border-collapse: collapse">
    <tr class="EditFormHeader">
        <td colspan="2">
            <b>Employee Details</b>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <b>Personal Info:</b>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Country:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.Country"  ) %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>City:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.City") %>'
                            TabIndex="1">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Region:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.Region") %>'
                            TabIndex="2">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Home Phone:
                    </td>
                    <td>
                        <telerik:RadMaskedTextBox ID="HomePhoneBox" runat="server" SelectionOnFocus="SelectAll"
                            Text='<%# DataBinder.Eval( Container, "DataItem.HomePhone") %>' PromptChar="_"
                            Width="300px" Mask="(###) ###-####" TabIndex="3">
                        </telerik:RadMaskedTextBox>
                    </td>
                </tr>
                <tr>
                    <td>Birth Date:
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="BirthDatePicker" runat="server" MinDate="1/1/1900" DbSelectedDate='<%# DataBinder.Eval( Container, "DataItem.BirthDate") %>'
                            TabIndex="4">
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>Title Of Courtesy
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlTOC" runat="server" TabIndex="7">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </td>
        <td>
            <table id="Table1" cellspacing="1" cellpadding="1" width="300" border="0">
                <tr>
                    <td>Notes:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" Text='<%# DataBinder.Eval( Container, "DataItem.Notes") %>'
                            runat="server" TextMode="MultiLine" Rows="5" Columns="40" TabIndex="5">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Address:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox6" Text='<%# DataBinder.Eval( Container, "DataItem.Address") %>'
                            runat="server" TextMode="MultiLine" Rows="2" Columns="40" TabIndex="6">
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <b>Company Info:</b>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table4" cellspacing="1" cellpadding="1" width="300" border="0">
                <tr>
                    <td>FirstName:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" Text='<%# DataBinder.Eval( Container, "DataItem.FirstName") %>'
                            runat="server" TabIndex="8">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Last Name:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" Text='<%# DataBinder.Eval( Container, "DataItem.LastName") %>'
                            runat="server" TabIndex="9">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Hire Date:
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="HireDatePicker" DbSelectedDate='<%# DataBinder.Eval( Container, "DataItem.HireDate") %>'
                            runat="server" TabIndex="10">
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td>Title:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" Text='<%# DataBinder.Eval( Container, "DataItem.Title") %>'
                            runat="server" TabIndex="11">
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
        <td></td>
    </tr>
    <tr>
        <td align="right" colspan="2">
            <asp:Button ID="btnUpdate" Text="Update" runat="server" CommandName="Update" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>'></asp:Button>
            <asp:Button ID="btnInsert" Text="Insert" runat="server" CommandName="PerformInsert"
                Visible='<%# DataItem is Telerik.Web.UI.GridInsertionObject %>'></asp:Button>
            &nbsp;
            <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                CommandName="Cancel"></asp:Button>
        </td>
    </tr>
</table>--%>

<table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="1" rules="none"
    style="border-collapse: collapse">
    <tr class="EditFormHeader">
        <td colspan="2">
            <b>
                <asp:Literal runat="server" ID="litAcao" Text='<%# DataItem is Telerik.Web.UI.GridInsertionObject ? "Detalhes da Nova Categoria:" : "Editar Categoria " + Eval("nome") %>'></asp:Literal>
                </b>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table3" cellspacing="1" cellpadding="1" width="100%" border="0">
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 95px;">Nome:
                    </td>
                    <td>
                        <asp:TextBox ID="txtNome" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.nome"  ) %>'>
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Categoria Pai:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCategoriaPai" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.idCategoriaPai") %>' TabIndex="1">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Ordem:
                    </td>
                    <td>
                        <asp:TextBox ID="txtOrdem" runat="server" Text='<%# DataBinder.Eval( Container, "DataItem.ordem") %>' TabIndex="1">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Ativa:
                    </td>
                    <td>
                        <asp:CheckBox ID="ckbAtiva" runat="server" Text="Ativa" Checked='<%# DataBinder.Eval( Container, "DataItem.ativa") != DBNull.Value ? Convert.ToBoolean( DataBinder.Eval( Container, "DataItem.ativa")) : false%>' TabIndex="2" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnUpdate" Text="Salvar" runat="server" CommandName="Update" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>'></asp:Button>
                        <asp:Button ID="btnInsert" Text="Incluir" runat="server" CommandName="PerformInsert" Visible='<%# DataItem is Telerik.Web.UI.GridInsertionObject %>'></asp:Button>
                        &nbsp;
                        <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False" CommandName="Cancel"></asp:Button>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
