<%@ Control Language="C#" AutoEventWireup="true" CodeFile="uscDestaquesHome.ascx.cs" Inherits="controles_uscDestaquesHome" %>

<asp:Repeater ID="rptDestaquesHome" runat="server">
    <ItemTemplate>
        <div class="col-sm-4">
            <div class="product-image-wrapper">
                <div class="single-products">
                    <div class="productinfo text-center">
                        <img width="255" height="224" src="<%#ResolveUrl("../" + Eval("caminhoFoto")) %>" alt="">
                        <h2>+</h2>
                        <p>Exemplo</p>
                        <a href="<%# ResolveUrl("../produto/" + Eval("idProduto") + "/" + Eval("nome_url")) %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                    </div>
                    <div class="product-overlay">
                        <div class="overlay-content">
                            <h2>+</h2>
                            <p>Exemplo</p>
                            <a href="<%# ResolveUrl("../produto/" + Eval("idProduto") + "/" + Eval("nome_url")) %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>
                    </div>
                </div>
                <div class="choose">
                    <ul class="nav nav-pills nav-justified">
                        <li><a href="#"><i class="fa fa-plus-square"></i>lista</a></li>
                        <li><a href="<%#ResolveUrl("../IncluirNaLista/" + Eval("idProduto")) %>"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

