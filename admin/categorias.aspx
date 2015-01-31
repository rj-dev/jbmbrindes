<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="categorias.aspx.cs" Inherits="admin_categorias" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <telerik:RadWindowManager runat="server" ID="RadWindowManager1"></telerik:RadWindowManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <telerik:RadTreeView ID="RadTreeView1" runat="server" Skin="Vista" CheckBoxes="Tru  e" TriStateCheckBoxes="true">
            </telerik:RadTreeView>
        </ContentTemplate>
    </asp:UpdatePanel>



    <asp:TreeView ID="tvCategorias" runat="server" ShowCheckBoxes="All" OnSelectedNodeChanged="tvCategorias_OnSelectedNodeChanged" ShowExpandCollapse="True"></asp:TreeView>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="idProdutosCategorias">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="idProdutosCategorias" HeaderText="idProdutosCategorias" InsertVisible="False" ReadOnly="True" SortExpression="idProdutosCategorias" />
            <asp:BoundField DataField="idCategoriaPai" HeaderText="idCategoriaPai" SortExpression="idCategoriaPai" />
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
            <asp:BoundField DataField="nome_url" HeaderText="nome_url" SortExpression="nome_url" />
            <asp:BoundField DataField="ativa" HeaderText="ativa" SortExpression="ativa" />
            <asp:BoundField DataField="ordem" HeaderText="ordem" SortExpression="ordem" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:criartConnectionString %>"
        DeleteCommand="DELETE FROM [tbprodutoscategorias] WHERE [idProdutosCategorias] = ?"
        InsertCommand="INSERT INTO [tbprodutoscategorias] (idProdutosCategorias, idCategoriaPai, nome, nome_url, ativa, ordem) VALUES (@idProdutosCategorias, @idCategoriaPai, @nome, @nome_url, @ativa, @ordem)"
        ProviderName="<%$ ConnectionStrings:criartConnectionString.ProviderName %>"
        SelectCommand="SELECT idProdutosCategorias, idCategoriaPai, nome, nome_url, ativa, ordem FROM tbprodutoscategorias Where idCategoriaPai = @idCategoriaPai"
        UpdateCommand="UPDATE tbprodutoscategorias SET idCategoriaPai = @idCategoriaPai, nome = @nom, nome_url = @nome_url, ativa = @ativa, ordem = @ordem WHERE idProdutosCategorias = @idProdutosCategorias">
        <SelectParameters>
            <asp:Parameter Name="idCategoriaPai" Type="Int32" DefaultValue="0" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="idProdutosCategorias" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idProdutosCategorias" Type="Int32" />
            <asp:Parameter Name="idCategoriaPai" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="nome_url" Type="String" />
            <asp:Parameter Name="ativa" Type="Object" />
            <asp:Parameter Name="ordem" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="idCategoriaPai" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="nome_url" Type="String" />
            <asp:Parameter Name="ativa" Type="Object" />
            <asp:Parameter Name="ordem" Type="Int32" />
            <asp:Parameter Name="idProdutosCategorias" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

