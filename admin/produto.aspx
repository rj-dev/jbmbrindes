<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="produto.aspx.cs" Inherits="admin_produto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <asp:ImageButton runat="server" AlternateText="Novo" PostBackUrl="produtoAlt.aspx"/>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_OnRowCommand" OnDataBound="GridView1_OnDataBound" OnRowDataBound="GridView1_OnRowDataBound">
        <Columns>
            <asp:BoundField HeaderText="Nome" DataField="nome" />
            <asp:CheckBoxField DataField="ativo" HeaderText="Ativo" />
            <asp:BoundField HeaderText="Unidade" DataField="unidade" />
            <asp:BoundField HeaderText="Código de Barras" DataField="codigodebarras" />
            <asp:BoundField HeaderText="Referencia" DataField="referencia" />
            <asp:BoundField HeaderText="Código de Barras" DataField="codigodebarras" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ibtEditar" runat="server" AlternateText="editar"/>
                    <asp:HiddenField runat="server" ID="hfIdProduto" Value='<%#Eval("idProduto") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="ibtExcluir" runat="server" AlternateText="excluir" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>

