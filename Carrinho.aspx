<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Carrinho.aspx.cs" Inherits="Carrinho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <h1>Lista de Orçamento</h1>
    <div style="width: 600px;margin: 0px auto;">
        <asp:GridView ID="CarrinhoLista" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
            CssClass="CarrinhoListaItem" Width="600" OnRowCommand="CarrinhoLista_OnRowCommand">

            <AlternatingRowStyle CssClass="CarrinhoListaItemAlt" />

            <Columns>
                <asp:BoundField DataField="ProdutoID" HeaderText="ID" SortExpression="ProdutoID" Visible="False" />

                <asp:TemplateField HeaderText="Foto">
                    <ItemTemplate>
                        <img style="border: 0;" src='<%# "images/produto/" + Eval("ProdutoID") + "/_pequena_" +Eval("ProdutoID")+ "_" + Eval("Foto").ToString().Substring(Eval("Foto").ToString().LastIndexOf('/') + 1) %>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="ProdutoNome" HeaderText="Nome" SortExpression="ProdutoNome" />

                <asp:TemplateField HeaderText="Quantidade">

                    <ItemTemplate>

                        <asp:TextBox ID="QuantidadeComprada" Width="40" runat="server" Text='<%# Eval("Quantidade")%>'></asp:TextBox>

                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Remover Item">

                    <ItemTemplate>

                        <asp:CheckBox ID="Remover" runat="server" Visible="False"></asp:CheckBox>
                        <asp:LinkButton ID="lbtRemover" runat="server" CommandArgument='<%#Eval("ProdutoID")%>' Text="x remover" ForeColor="Red"></asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>

            <FooterStyle CssClass="CarrinhoListaFooter" />

            <HeaderStyle CssClass="CarrinhoListaHead" />

        </asp:GridView>
        <asp:Button runat="server" ID="btnOrcamento" Text="Orçamento" />
    </div>


    <div>

        <p></p>

        <strong>

            <asp:Label ID="LabelTotalText" runat="server" Text="Total Pedido: " Visible="False"></asp:Label>

            <asp:Label CssClass="NormalBold" ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>

        </strong>

    </div>

    <br />

</asp:Content>

