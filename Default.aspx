<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/controles/ucMenuCategoria.ascx" TagPrefix="uc1" TagName="ucMenuCategoria" %>
<%@ Register Src="~/controles/uscDestaquesHome.ascx" TagPrefix="uc1" TagName="uscDestaquesHome" %>
<%@ Register Src="~/controles/usrDestaquesHomeTab.ascx" TagPrefix="uc1" TagName="usrDestaquesHomeTab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section id="slider">
        <!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class=""></li>
                            <li data-target="#slider-carousel" data-slide-to="1" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="2" class=""></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-CRIART</h1>
                                    <h2>Bem vindos </h2>
                                    <p>nossa loja virtual. </p>
                                    <button type="button" class="btn btn-default get">Visualizar</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="Images/girl1.png" class="girl img-responsive" alt="">
                                    <img src="Images/pricing.png" class="pricing" alt="">
                                </div>
                            </div>
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-CRIART</h1>
                                    <h2>Bem vindos </h2>
                                    <p>nossa loja virtual. </p>
                                    <button type="button" class="btn btn-default get">Visualizar</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="Images/girl2.png" class="girl img-responsive" alt="">
                                    <img src="Images/pricing.png" class="pricing" alt="">
                                </div>
                            </div>

                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-CRIART</h1>
                                    <h2>Bem vindos </h2>
                                    <p>nossa loja virtual. </p>
                                    <button type="button" class="btn btn-default get">Visualizar</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="Images/girl3.png" class="girl img-responsive" alt="">
                                    <img src="Images/pricing.png" class="pricing" alt="">
                                </div>
                            </div>

                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--/slider-->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <uc1:ucMenuCategoria runat="server" ID="ucMenuCategoria" />
                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items">
                        <!--features_items-->
                        <h2 class="title text-center">Nossos Produtos</h2>
                        
                        <uc1:uscDestaquesHome runat="server" ID="uscDestaquesHome1" />

                        <%--<div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="Images/product1.jpg" alt="">
                                        <h2>+</h2>
                                        <p>Exemplo</p>
                                        <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>+</h2>
                                            <p>Exemplo</p>
                                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>lista</a></li>
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="Images/product2.jpg" alt="">
                                        <h2>+</h2>
                                        <p>Exemplo</p>
                                        <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>+</h2>
                                            <p>Exemplo</p>
                                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>lista</a></li>
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="Images/product3.jpg" alt="">
                                        <h2>+</h2>
                                        <p>Exemplo</p>
                                        <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>+</h2>
                                            <p>Exemplo</p>
                                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>lista</a></li>
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="Images/product4.jpg" alt="">
                                        <h2>+</h2>
                                        <p>Exemplo</p>
                                        <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>+</h2>
                                            <p>Exemplo</p>
                                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>lista</a></li>
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="Images/product5.jpg" alt="">
                                        <h2>+</h2>
                                        <p>Exemplo</p>
                                        <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>+</h2>
                                            <p>Exemplo</p>
                                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>lista</a></li>
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="Images/product6.jpg" alt="">
                                        <h2>+</h2>
                                        <p>Exemplo</p>
                                        <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                    </div>
                                    <div class="product-overlay">
                                        <div class="overlay-content">
                                            <h2>+</h2>
                                            <p>Exemplo</p>
                                            <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>lista</a></li>
                                        <li><a href="http://www.flowsys.com.br/criart/#"><i class="fa fa-plus-square"></i>Orçamento</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>--%>

                    </div>
                    <!--features_items-->
                    
                    <!--category-tab-->
                    <uc1:usrDestaquesHomeTab runat="server" id="usrDestaquesHomeTab1" />
                    <!--/category-tab-->

                    

                    <div class="recommended_items">
                        <!--recommended_items-->
                        <h2 class="title text-center">ITENS RECOMENDADOS</h2>

                        <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="item">
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Images/recommend1.jpg" alt="">
                                                    <h2>+</h2>
                                                    <p>Produto</p>
                                                    <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Images/recommend2.jpg" alt="">
                                                    <h2>+</h2>
                                                    <p>Produto</p>
                                                    <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Images/recommend3.jpg" alt="">
                                                    <h2>+</h2>
                                                    <p>Produto</p>
                                                    <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="item active">
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Images/recommend1.jpg" alt="">
                                                    <h2>+</h2>
                                                    <p>Produto</p>
                                                    <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Images/recommend2.jpg" alt="">
                                                    <h2>+</h2>
                                                    <p>Produto</p>
                                                    <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="product-image-wrapper">
                                            <div class="single-products">
                                                <div class="productinfo text-center">
                                                    <img src="Images/recommend3.jpg" alt="">
                                                    <h2>+</h2>
                                                    <p>Produto</p>
                                                    <a href="http://www.flowsys.com.br/criart/#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Orçamento</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="left recommended-item-control" href="http://www.flowsys.com.br/criart/#recommended-item-carousel" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a class="right recommended-item-control" href="http://www.flowsys.com.br/criart/#recommended-item-carousel" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>
                    </div>
                    <!--/recommended_items-->

                </div>
            </div>
        </div>
    </section>

</asp:Content>

