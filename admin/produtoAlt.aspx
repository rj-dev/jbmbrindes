<%@ Page Language="C#" AutoEventWireup="true" CodeFile="produtoAlt.aspx.cs" Inherits="admin_produtoAlt" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <script type="text/javascript">
            function CloseAndRebind(args) {
                GetRadWindow().BrowserWindow.refreshGrid(args);
                GetRadWindow().close();
            }

            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

                return oWindow;
            }

            function CancelEdit() {
                GetRadWindow().close();
            }


            function ShowpImagePreview1(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#img1').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function ShowpImagePreview2(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#img2').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function ShowpImagePreview3(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#img3').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function ShowpImagePreview4(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#img4').attr('src', e.target.result);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>

        <asp:ScriptManager ID="ScriptManager2" runat="server" />
        <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
        <telerik:RadWindowManager runat="server" id="RadWindowManager1"></telerik:RadWindowManager>

        <asp:DetailsView ID="DetailsView1" DataKeyNames="idProduto" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1"
            Height="50px" Width="125px"
            OnItemCommand="DetailsView1_ItemCommand"
            OnModeChanging="DetailsView1_OnModeChanging"
            BorderWidth="0px" CellPadding="0" CellSpacing="7" GridLines="None"
            OnItemInserting="DetailsView1_OnItemInserting"
            OnItemInserted="DetailsView1_OnItemInserted"
            OnItemUpdating="DetailsView1_ItemUpdating"
            OnItemUpdated="DetailsView1_OnItemUpdated">
            <Fields>
                <asp:TemplateField>
                    <EditItemTemplate>

                        <div style="float: left">
                            Nome<br />
                            <telerik:RadTextBox ID="txtNome" runat="server" Text='<%#Eval("nome") %>'></telerik:RadTextBox>
                        </div>
                        <div style="float: left">
                            Unidade<br />
                            <telerik:RadTextBox ID="txtUnidade" runat="server" Text='<%#Eval("unidade") %>'></telerik:RadTextBox>
                            <asp:CheckBox ID="ckbAtivo" runat="server" Text="Ativo" Checked='<%# Eval("Ativo") == DBNull.Value ? Convert.ToBoolean("False") : Convert.ToBoolean(Eval("ativo")) %>' />
                            <asp:CheckBox ID="ckbDestaqueHome" runat="server" Text="Destaque Home" />
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Categoria
                        <div style="float: right; overflow-y: scroll; height: 170px; width: 200px;">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <telerik:RadTreeView ID="RadTreeView1" runat="server" Skin="Vista" CheckBoxes="True" TriStateCheckBoxes="true">
                            </telerik:RadTreeView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            
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
                        <div style="float: left;">
                            Descrição
    <telerik:RadEditor ID="txtDescricao" runat="server" Skin="Vista" content='<%#Eval("descricao") %>'></telerik:RadEditor>
                        </div>
                        <div style="clear: both; height: 50px;"></div>
                        <div>
                            <div style="float: left; text-align: center;">
                                <img id="img1" src="" alt="" width="100" /><br />
                                <asp:CheckBox ID="CheckBox1" runat="server" Text="Excluir" Visible='<%# !(DetailsView1.CurrentMode == DetailsViewMode.Insert) %>' /><br />
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="115" onchange="ShowpImagePreview1(this)" />
                                <asp:HiddenField ID="hfNomeImg1" runat="server" />
                            </div>
                            <div style="float: left; text-align: center;">
                                <img id="img2" src="" alt="" width="100" /><br />
                                <asp:CheckBox ID="CheckBox2" runat="server" Text="Excluir" Visible='<%# !(DetailsView1.CurrentMode == DetailsViewMode.Insert) %>' /><br />
                                <asp:FileUpload ID="FileUpload2" runat="server" Width="115" onchange="ShowpImagePreview2(this)" />
                                <asp:HiddenField ID="hfNomeImg2" runat="server" />
                            </div>
                            <div style="float: left; text-align: center;">
                                <img id="img3" src="" alt="" width="100" /><br />
                                <asp:CheckBox ID="CheckBox3" runat="server" Text="Excluir" Visible='<%# !(DetailsView1.CurrentMode == DetailsViewMode.Insert) %>' /><br />
                                <asp:FileUpload ID="FileUpload3" runat="server" Width="115" onchange="ShowpImagePreview3(this)" />
                                <asp:HiddenField ID="hfNomeImg3" runat="server" />
                            </div>
                            <div style="float: left; text-align: center;">
                                <img id="img4" src="" alt="" width="100" /><br />
                                <asp:CheckBox ID="CheckBox4" runat="server" Text="Excluir" Visible='<%# !(DetailsView1.CurrentMode == DetailsViewMode.Insert) %>' /><br />
                                <asp:FileUpload ID="FileUpload4" runat="server" Width="115" onchange="ShowpImagePreview4(this)" />
                                <asp:HiddenField ID="hfNomeImg4" runat="server" />
                            </div>
                        </div>
                        <div style="clear: both; height: 20px;"></div>
                        <div>
                            <asp:Button ID="btnUpdate" Text='<%# (DetailsView1.CurrentMode == DetailsViewMode.Insert) ? "Adicionar" : "Salvar" %>'
                                runat="server" CommandName='<%# (DetailsView1.CurrentMode == DetailsViewMode.Insert) ? "PerformInsert" : "Update" %>' CausesValidation="False"></asp:Button>&nbsp;
                                <asp:Button ID="btnCancel" Text="Cancelar" runat="server" CausesValidation="False"
                                    CommandName="Cancel"></asp:Button>
                        </div>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Fields>

        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:criartConnectionString %>"
            DeleteCommand="DELETE FROM produtos WHERE idProduto = ?"
            InsertCommand="INSERT INTO produtos (idProduto, nome, nome_url, descricao, unidade, codigoDeBarras, referencia, dtCadastro, ativo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            ProviderName="<%$ ConnectionStrings:criartConnectionString.ProviderName %>"
            SelectCommand="SELECT idProduto, nome, nome_url, descricao, unidade, codigoDeBarras, referencia, dtCadastro, ativo FROM produtos WHERE idProduto = ?"
            UpdateCommand="UPDATE produtos SET nome = ?, nome_url = ?, descricao = ?, unidade = ?, codigoDeBarras = ?, referencia = ?, dtCadastro = ?, ativo = ? WHERE idProduto = ?">
            <SelectParameters>
                <asp:QueryStringParameter Name="produtoId" QueryStringField="produtoId" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="idProduto" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idProduto" Type="Int32" />
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="nome_url" Type="String" />
                <asp:Parameter Name="descricao" Type="String" />
                <asp:Parameter Name="unidade" Type="String" />
                <asp:Parameter Name="codigoDeBarras" Type="String" />
                <asp:Parameter Name="referencia" Type="String" />
                <asp:Parameter Name="dtCadastro" Type="DateTime" />
                <asp:Parameter Name="ativo" Type="Object" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="nome_url" Type="String" />
                <asp:Parameter Name="descricao" Type="String" />
                <asp:Parameter Name="unidade" Type="String" />
                <asp:Parameter Name="codigoDeBarras" Type="String" />
                <asp:Parameter Name="referencia" Type="String" />
                <asp:Parameter Name="dtCadastro" Type="DateTime" />
                <asp:Parameter Name="ativo" Type="Object" />
                <asp:Parameter Name="idProduto" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
