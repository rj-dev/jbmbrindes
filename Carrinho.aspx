<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>Carrinho de Compras</h1>


    <asp:GridView ID="CarrinhoLista" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="CarrinhoItem" CssClass="CarrinhoListaItem" SelectMethod="GetCarrinhoItens" Width="600">

        <AlternatingRowStyle CssClass="CarrinhoListaItemAlt" />

        <Columns>
            <asp:BoundField DataField="ProdutoID" HeaderText="ID" SortExpression="ProduotID" />

            <asp:TemplateField HeaderText="Foto">
                <ItemTemplate>
                    <img style="border: 0;" src='<%# "images/produto/" + Eval("ProdutoId") + "/_pequena_" +Eval("ProdutoId")+ "_" + Eval("ProdutoFoto").ToString().Substring(Eval("ProdutoFoto").ToString().LastIndexOf('/') + 1) %>' />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="ProdutoNome" HeaderText="Nome" SortExpression="ProdutoNome" />

            <asp:BoundField DataField="Produto.PrecoUnitario" HeaderText="Preço (un.)" DataFormatString="{0:c}" />


            <asp:TemplateField HeaderText="Quantidade">

                <ItemTemplate>

                    <asp:TextBox ID="QuantidadeComprada" Width="40" runat="server" Text='<%# Eval("Quantidade")%>'></asp:TextBox>

                </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Total ">

                <ItemTemplate>

                    <%--  <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantidade)) * Convert.ToDouble(Item.Produto.PrecoUnitario)))%>--%>
                </ItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Remover Item">

                <ItemTemplate>

                    <asp:CheckBox ID="Remover" runat="server"></asp:CheckBox>

                </ItemTemplate>

            </asp:TemplateField>

        </Columns>

        <FooterStyle CssClass="CarrinhoListaFooter" />

        <HeaderStyle CssClass="CarrinhoListaHead" />

    </asp:GridView>

    <div>

        <p></p>

        <strong>

            <asp:Label ID="LabelTotalText" runat="server" Text="Total Pedido: "></asp:Label>

            <asp:Label CssClass="NormalBold" ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>

        </strong>

    </div>

    <br />

</asp:Content>

