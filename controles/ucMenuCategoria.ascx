<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucMenuCategoria.ascx.cs" Inherits="controles_ucMenuCategoria" %>

<h2>Categorias</h2>

<div class="panel-group category-products" id="accordian">
    <!--category-productsr-->
    <asp:Repeater runat="server" ID="rptCategoria" OnItemDataBound="rptCategoria_OnItemDataBound">
        <ItemTemplate>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordian" href="<%# "#" + Eval("nome_url") + rptCategoria.Items.Count %>" class="collapsed">
                            <span class="badge pull-right"><i class="fa <%# Convert.ToInt32(Eval("subcategorias")) > 0 ? "fa-plus" : "" %>"></i></span>
                            <asp:Literal runat="server" Text='<%#Eval("nome") %>'></asp:Literal>
                            <asp:HiddenField ID="hfIdCategoria" runat="server" Value='<%#Eval("idProdutosCategorias") %>' />
                            <asp:HiddenField ID="hfNomeUrl" runat="server" Value='<%#Eval("nome_url") %>' />
                        </a>
                    </h4>
                </div>
                <asp:Literal ID="litMenuFilhaTopo" runat="server"></asp:Literal>
                <asp:Repeater ID="rptCategoriaFilha" runat="server">
                    <ItemTemplate>
                        <li><a href="#">
                            <asp:Literal runat="server" Text='<%#Eval("nome") %>'></asp:Literal></a></li>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Literal ID="litMenuFilhaRodape" runat="server"></asp:Literal>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

