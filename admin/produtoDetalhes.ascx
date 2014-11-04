<%@ Control Language="C#" AutoEventWireup="true" CodeFile="produtoDetalhes.ascx.cs" Inherits="admin_produtoDetalhes" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI, Version=2009.3.1208.20, Culture=neutral, PublicKeyToken=121fae78165ba3d4" %>


<div style="float: left">
    Nome<br />
    <telerik:RadTextBox ID="txtNome" runat="server" Text='<%#Eval("nome") %>'></telerik:RadTextBox>
</div>
<div style="float: left">
    Unidade<br />
    <telerik:RadTextBox ID="txtUnidade" runat="server" Text='<%#Eval("unidade") %>'></telerik:RadTextBox>
    <asp:CheckBox ID="ckbAtivo" runat="server" Text="Ativo" Checked='<%#Convert.ToBoolean(Eval("ativo")) %>' />
</div>
<br />
<br />
<br />
<div>
    Código de Barras<br />
    <telerik:RadTextBox ID="txtCodigoDeBarras" runat="server" Width="250" Text='<%#Eval("codigodebarras") %>'></telerik:RadTextBox>
</div>
<div>
    Referencia<br />
    <telerik:RadTextBox ID="txtReferencia" runat="server" Width="250" Text='<%#Eval("referencia") %>'></telerik:RadTextBox>
</div>
<div>
    Descrição
    <telerik:RadEditor ID="txtDescricao" runat="server" Skin="Vista" Height="250" Content='<%#Eval("descricao") %>'></telerik:RadEditor>
</div>
<div style="clear: both; height: 50px;"></div>


<div>
    <div style="float: left; text-align: center;">
        <img id="img1" src="" alt="" width="100" /><br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
        <asp:FileUpload ID="FileUpload1" runat="server" Width="115" onchange="ShowpImagePreview1(this)" />
        <telerik:RadAsyncUpload runat="server" ID="RadAsyncUpload1"></telerik:RadAsyncUpload>
    </div>
    <div style="float: left; text-align: center;">
        <img id="img2" src="" alt="" width="100" /><br />
        <asp:CheckBox ID="CheckBox2" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
        <asp:FileUpload ID="FileUpload2" runat="server" Width="115" onchange="ShowpImagePreview2(this)" />
    </div>
    <div style="float: left; text-align: center;">
        <img id="img3" src="" alt="" width="100" /><br />
        <asp:CheckBox ID="CheckBox3" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
        <asp:FileUpload ID="FileUpload3" runat="server" Width="115" onchange="ShowpImagePreview3(this)" />
    </div>
    <div style="float: left; text-align: center;">
        <img id="img4" src="" alt="" width="100" /><br />
        <asp:CheckBox ID="CheckBox4" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
        <asp:FileUpload ID="FileUpload4" runat="server" Width="115" onchange="ShowpImagePreview4(this)" />
    </div>
</div>


<div style="clear: both; height: 20px;"></div>
<div>
    <asp:Button ID="btnUpdate" Text="Salvar" runat="server" CommandName="Update" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>'></asp:Button>
    <asp:Button ID="btnInsert" Text="Incluir" runat="server" CommandName="PerformInsert" Visible='<%# DataItem is Telerik.Web.UI.GridInsertionObject %>'></asp:Button>
    &nbsp;
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False" CommandName="Cancel"></asp:Button>
</div>
