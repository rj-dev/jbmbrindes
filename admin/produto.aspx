<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="produto.aspx.cs" Inherits="admin_produto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />

    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function onPopUpShowing(sender, args) {
                args.get_popUp().className += " popUpEditForm";
            }

            function Idade() {
                var input = document.getElementById('ContentPlaceHolder1_RadGrid1_ctl00_ctl05_EditFormControl_FileUpload1');

                var ooo;
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    ooo = reader;
                }

                $.ajax({
                    type: "POST",
                    url: "produto.aspx/Idade",
                    data: "{foto: '" + ooo.readAsBinaryString + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function onSucess(result) {
                        alert(result);
                    },
                    error: function onerror(result) {
                        alert('Something wrong.');
                    }
                });
            }

            function ShowEditForm(id, rowIndex) {
                var grid = $find("<%= RadGrid1.ClientID %>");

                var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                grid.get_masterTableView().selectItem(rowControl, true);

                window.radopen("produtoAlt.aspx?produtoId=" + id, "UserListDialog");
                return false;
            }
            function ShowInsertForm() {
                window.radopen("produtoAlt.aspx", "UserListDialog");
                return false;
            }
            function refreshGrid(arg) {
                if (!arg) {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                }
                else {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                }
            }

            function RowDblClick(sender, eventArgs) {
                window.radopen("EditForm_csharp.aspx?EmployeeID=" + eventArgs.getDataKeyValue("EmployeeID"), "UserListDialog");
            }

        </script>
    </telerik:RadCodeBlock>


    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="divMsgs"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>

    <p id="divMsgs" runat="server">
        <asp:Label ID="Label1" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#FF8080">
        </asp:Label>
        <asp:Label ID="Label2" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#00C000">
        </asp:Label>
    </p>

    <%--
        
        OnDeleteCommand="RadGrid1_DeleteCommand"
    --%>


    <telerik:RadGrid ID="RadGrid1" runat="server" ShowFooter="True"
        AllowSorting="True" AutoGenerateColumns="False" ShowStatusBar="True" GridLines="None" Skin="Office2007"
        OnNeedDataSource="RadGrid1_NeedDataSource"
        OnItemDeleted="RadGrid1_ItemDeleted"
        OnItemInserted="RadGrid1_ItemInserted"
        OnItemUpdated="RadGrid1_ItemUpdated"
        OnItemCommand="RadGrid1_ItemCommand"
        OnUpdateCommand="RadGrid1_UpdateCommand"
        OnInsertCommand="RadGrid1_InsertCommand"
        OnItemCreated="RadGrid1_ItemCreated">

        <MasterTableView CommandItemDisplay="Top" Width="45%" NoMasterRecordsText="Nenhum registro encontrado" DataKeyNames="idProduto">

            <%--<CommandItemSettings AddNewRecordText="Adicionar novo produto" RefreshText="Atualizar">               
            </CommandItemSettings>--%>
            <CommandItemTemplate>
                <a href="#" onclick="return ShowInsertForm();">Add New Record</a>
            </CommandItemTemplate>
            <RowIndicatorColumn>
                <HeaderStyle Width="20px"></HeaderStyle>
            </RowIndicatorColumn>

            <ExpandCollapseColumn>
                <HeaderStyle Width="20px"></HeaderStyle>
            </ExpandCollapseColumn>
            <%--<EditFormSettings>
                <EditColumn UniqueName="EditCommandColumn1"></EditColumn>

                <PopUpSettings Modal="true" />
            </EditFormSettings>--%>
            <Columns>
                <telerik:GridBoundColumn DefaultInsertValue="" HeaderText="Nome" DataField="nome" UniqueName="nome">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="ativo" DataType="System.Boolean" DefaultInsertValue="" HeaderText="Ativo" UniqueName="ativo">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridBoundColumn DefaultInsertValue="" HeaderText="Unidade" DataField="unidade" UniqueName="unidade">
                    <HeaderStyle Width="50px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DefaultInsertValue="" HeaderText="Código de Barras" DataField="codigodebarras" UniqueName="codigodebarras">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DefaultInsertValue="" HeaderText="Referencia" DataField="referencia" UniqueName="referencia">
                </telerik:GridBoundColumn>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="TemplateEditColumn">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn UniqueName="DeleteColumn" Text="Delete" CommandName="Delete" ButtonType="ImageButton">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
                <telerik:GridTemplateColumn UniqueName="TemplateEditColumn" Visible="False">
                    <ItemTemplate>
                        <asp:HyperLink ID="EditLink" runat="server" Text="Edit"></asp:HyperLink>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
            <%--<EditFormSettings EditFormType="Template">
                <FormTemplate>
                    <div style="float: left">
                        Nome<br />
                        <telerik:RadTextBox ID="txtNome" runat="server" Text='<%#Eval("nome") %>'></telerik:RadTextBox>
                    </div>
                    <div style="float: left">
                        Unidade<br />
                        <telerik:RadTextBox ID="txtUnidade" runat="server" Text='<%#Eval("unidade") %>'></telerik:RadTextBox>
                        <asp:CheckBox ID="ckbAtivo" runat="server" Text="Ativo" Checked='<%# Eval("Ativo") == DBNull.Value ? Convert.ToBoolean("False") : Convert.ToBoolean(Eval("ativo")) %>' />
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
                    <div>
                        Descrição
    <telerik:RadEditor ID="txtDescricao" runat="server" Skin="Vista" Height="250" Content='<%#Eval("descricao") %>'></telerik:RadEditor>
                    </div>
                    <div style="clear: both; height: 50px;"></div>
                    <div>
                        <div style="float: left; text-align: center;">
                            <img id="img1" src="" alt="" width="100" /><br />
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />

                            <asp:FileUpload ID="FileUpload1" runat="server" Width="115" onchange="ShowpImagePreview1(this)" />

                        </div>
                        <div style="float: left; text-align: center;">
                            <img id="img2" src="" alt="" width="100" /><br />
                            <asp:CheckBox ID="CheckBox2" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
                            <asp:FileUpload ID="FileUpload2" runat="server" Width="115" onchange="ShowpImagePreview2(this)" />
                        </div>
                        <div style="float: left; text-align: center;">
                            <img id="img3" src="" alt="" width="100" /><br />
                            <asp:CheckBox ID="CheckBox3" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
                            <asp:FileUpload ID="FileUpload3" runat="server" Width="115" onchange="ShowpImagePreview3(this)" />
                        </div>
                        <div style="float: left; text-align: center;">
                            <img id="img4" src="" alt="" width="100" /><br />
                            <asp:CheckBox ID="CheckBox4" runat="server" Text="Excluir" Visible='<%# !(DataItem is Telerik.Web.UI.GridInsertionObject) %>' /><br />
                            <asp:FileUpload ID="FileUpload4" runat="server" Width="115" onchange="ShowpImagePreview4(this)" />
                        </div>
                    </div>
                    <div style="clear: both; height: 20px;"></div>
                    <div>
                        <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Adicionar" : "Salvar" %>'
                            runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>' CausesValidation="False"></asp:Button>&nbsp;
                                <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                    CommandName="Cancel"></asp:Button>
                    </div>
                </FormTemplate>
            </EditFormSettings>--%>
            <%--<EditFormSettings UserControlName="produtoDetalhes.ascx" EditFormType="WebUserControl">
                <EditColumn UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>--%>
        </MasterTableView>

        <ClientSettings>
            <ClientEvents OnRowDblClick="RowDblClick" OnPopUpShowing="onPopUpShowing" />
        </ClientSettings>

    </telerik:RadGrid>

    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        <Windows>
            <telerik:RadWindow ID="UserListDialog" runat="server" Title="Editing record" Height="520px"
                Width="750px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                Modal="true">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>




</asp:Content>

