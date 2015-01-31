<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="categorias.aspx.cs" Inherits="admin_categorias" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function onPopUpShowing(sender, args) {
                args.get_popUp().className += " popUpEditForm";
            }
        </script>
    </telerik:RadCodeBlock>

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>


    <telerik:RadTreeView ID="RadTreeView1" runat="server" Skin="Vista"  OnNodeClick="RadTreeView1_OnNodeClick">
    </telerik:RadTreeView>

    <telerik:RadGrid ID="RadGrid1" runat="server" ShowFooter="True"
        AllowSorting="True" AutoGenerateColumns="False" ShowStatusBar="True" GridLines="None" Skin="Office2007"
        OnPreRender="RadGrid1_PreRender" OnItemCreated="RadGrid1_OnItemCreated"
        OnNeedDataSource="RadGrid1_NeedDataSource"
        OnUpdateCommand="RadGrid1_UpdateCommand"
        OnInsertCommand="RadGrid1_InsertCommand"
        OnDeleteCommand="RadGrid1_DeleteCommand">

        <MasterTableView CommandItemDisplay="Top" Width="45%" NoMasterRecordsText="Nenhum registro encontrado" DataKeyNames="idProdutosCategorias">

            <CommandItemSettings AddNewRecordText="Adicionar nova categoria" RefreshText="Atualizar"></CommandItemSettings>
            <RowIndicatorColumn>
                <HeaderStyle Width="20px"></HeaderStyle>
            </RowIndicatorColumn>

            <ExpandCollapseColumn>
                <HeaderStyle Width="20px"></HeaderStyle>
            </ExpandCollapseColumn>
            <EditFormSettings>
                <EditColumn UniqueName="EditCommandColumn1"></EditColumn>

                <PopUpSettings Modal="true" />
            </EditFormSettings>
            <Columns>
                <telerik:GridBoundColumn DefaultInsertValue="" HeaderText="Nome" DataField="nome" UniqueName="nome">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="ativa" DataType="System.Int32" DefaultInsertValue="" HeaderText="Ativa" UniqueName="ativa">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridBoundColumn DefaultInsertValue="" HeaderText="Ordem" DataField="ordem" UniqueName="ordem">
                    <HeaderStyle Width="50px" />
                </telerik:GridBoundColumn>
                <telerik:GridEditCommandColumn ButtonType="ImageButton">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridEditCommandColumn>
                <telerik:GridButtonColumn UniqueName="DeleteColumn" Text="Delete" CommandName="Delete" ButtonType="ImageButton">
                    <HeaderStyle Width="40px" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>

            </Columns>

            <EditFormSettings UserControlName="categoriaDetalhes.ascx" EditFormType="WebUserControl">
                <EditColumn UniqueName="EditCommandColumn1">
                </EditColumn>
            </EditFormSettings>

        </MasterTableView>

        <ClientSettings>
            <ClientEvents OnRowDblClick="RowDblClick" OnPopUpShowing="onPopUpShowing" />
        </ClientSettings>

    </telerik:RadGrid>



</asp:Content>

