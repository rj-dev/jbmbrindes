<%@ Control Language="C#" AutoEventWireup="true" CodeFile="usrDestaquesHomeTab.ascx.cs" Inherits="controles_usrDestaquesHomeTab" %>

<div class="category-tab">
    <!--category-tab-->
    <div class="col-sm-12">
        <ul class="nav nav-tabs">
            <asp:Repeater runat="server" ID="rptTabs" OnItemDataBound="rptTabs_OnItemDataBound">
                <ItemTemplate>
                    <li <%#rptTabs.Items.Count == 0 ? "class=\"active\"" :"" %>><a href="#<%#Eval("nome_url")%>" data-toggle="tab"><%#Eval("nome") %></a></li>
                    <%--<li><a href="http://www.flowsys.com.br/criart/#blazers" data-toggle="tab">Produtos</a></li>
                    <li><a href="http://www.flowsys.com.br/criart/#sunglass" data-toggle="tab">Produtos</a></li>
                    <li><a href="http://www.flowsys.com.br/criart/#kids" data-toggle="tab">Produtos</a></li>
                    <li><a href="http://www.flowsys.com.br/criart/#poloshirt" data-toggle="tab">Produtos</a></li>--%>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
    <div class="tab-content">

        <asp:Repeater runat="server" ID="rptPanelTab" OnItemDataBound="rptPanelTab_OnItemDataBound">
            <ItemTemplate>
                <div class="tab-pane fade active <%#rptPanelTab.Items.Count == 1 ? "in" : "" %>" id="<%#Eval("nome_url") %>">
                    <asp:Repeater runat="server" ID="rptConteudoTab">
                        <ItemTemplate>
                            <div class="col-sm-3">
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <div class="productinfo text-center">
                                            <img width="183" src="<%#ResolveUrl("../" + Eval("foto").ToString()) %>" alt="">
                                            <h2>+</h2>
                                            <p><%#Eval("nome") %></p>
                                            <a href="<%#ResolveUrl("../IncluirNaLista/" + Eval("idProduto")) %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <asp:HiddenField runat="server" ID="hfIdCategoria" Value='<%#Eval("idProdutosCategorias")%>' />
            </ItemTemplate>
        </asp:Repeater>

        <%--<div class="tab-pane fade" id="blazers">
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery4.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery3.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery2.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery1.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="sunglass">
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery3.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery4.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery1.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery2.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="kids">
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery1.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery2.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery3.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery4.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="poloshirt">
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery2.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery4.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery3.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="product-image-wrapper">
                    <div class="single-products">
                        <div class="productinfo text-center">
                            <img src="../Images/gallery1.jpg" alt="">
                            <h2>+</h2>
                            <p>Produto</p>
                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>--%>
    </div>
</div>
<!--/category-tab-->
