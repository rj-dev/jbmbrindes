<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="produto.aspx.cs" Inherits="produto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="bloco_centro">
        <div itemscope="" itemtype="http://schema.org/Product" class="bloco_detalhes_produto">
            <div class="galeria_produto">
                <div id="gallery" class="content">
                    <%--<div class="slideshow-container">
                <div id="loading" class="loader"></div>
                <div id="slideshow" class="slideshow">
                    <a href="/Images/produto/1/product1.jpg" class="jqzoom" rel="gal1" title="" style="outline-style: none; text-decoration: none;">
                        <div class="zoomPad">
                            <img src="/Images/produto/1/_pequena_1_product1.jpg" id="imgFoto" alt="Caixa em bambu com 2 tacas para vinho e acessorios" title="" style="opacity: 1; width: 100px;" />
                            <div class="zoomPup" style="display: none; top: 93px; left: 238px; width: 366px; height: 286px; position: absolute; border-width: 0px;"></div>
                            <div class="zoomWindow" style="position: absolute; z-index: 5001; cursor: default; left: 0px; top: 0px; display: none;">
                                <div class="zoomWrapper" style="border-width: 0px; width: 605px;">
                                    <div class="zoomWrapperTitle" style="width: 100%; position: absolute; display: block;">undefined</div>
                                    <div class="zoomWrapperImage" style="width: 100%; height: 535px;">
                                        <img src="/Images/produto/1/product1.jpg" style="position: absolute; border: 0px; display: block; left: -395.04132231405px; top: -175.700934579439px;" />

                                    </div>
                                </div>
                            </div>
                            <div class="zoomPreload" style="visibility: hidden; top: 260.5px; left: 3.5px; position: absolute;">Carregando</div>
                        </div>
                    </a>
                </div>
            </div>
            <div id="caption" class="caption-container"></div>--%>

                    <a href="/images/produto/1/product1.jpg" class="jqzoom" title="MYTITLE" rel="gal1" runat="server" id="aImgZoom">
                        <img src="/images/produto/1/_media_1_product1.jpg" title="IMAGE TITLE" runat="server" id="imgSmall" />
                    </a>

                </div>
                <div id="thumbs" class="navigation">
                    <ul id="thumblist" class="thumbs">
                        <asp:Repeater ID="rptThumbFotos" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a rel="{gallery: 'gal1', 
                                   smallimage: '<%#ResolveUrl(Eval("caminhoFoto").ToString().Insert(Eval("caminhoFoto").ToString().LastIndexOf("/") + 1,"_media_" + Eval("idProduto") + "_")) %>',
                                   largeimage: '<%#ResolveUrl(Eval("caminhoFoto").ToString()) %>'}"
                                        href="javascript:void(0);" class="">
                                        <img src="<%#ResolveUrl(Eval("caminhoFoto").ToString().Insert(Eval("caminhoFoto").ToString().LastIndexOf("/") + 1,"_pequena_" + Eval("idProduto") + "_")) %>" alt="Caixa em bambu com 2 tacas para vinho e acessorios" title="Caixa em bambu com 2 tacas para vinho e acessorios" />
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                </div>
                
               
            </div>
            
             <div>
                    <asp:Button ID="btnOrcamento" runat="server" Text="Orçamento"></asp:Button>
                </div>

        </div>
    </div>
</asp:Content>

