using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_produto : System.Web.UI.Page
{
    public static String fu1;
    private object _dataItem = null;

    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    Page.Form.Attributes.Add("enctype", "multipart/form-data");
    //}

    //protected void RadGrid1_PreRender(object sender, System.EventArgs e)
    //{
    //    if (!this.IsPostBack)
    //    {
    //        if (this.RadGrid1.MasterTableView.Items.Count > 0)
    //        {
    //            this.RadGrid1.MasterTableView.Rebind();
    //        }

    //    }
    //}


    protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {
        using (var data = new criartEntities())
        {
            this.RadGrid1.DataSource = (from c in data.produtos select c).ToList();
        }

    }

    protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
    {
        GridEditableItem editedItem = e.Item as GridEditableItem;
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        var idProduto = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["idProduto"];

        try
        {
            using (var data = new criartEntities())
            {
                #region Dados Produto
                var produto = (from c in data.produtos
                               where c.idProduto == (int)idProduto
                               select c).FirstOrDefault();

                produto.nome = (e.Item.FindControl("txtNome") as RadTextBox).Text;
                produto.nome_url = (e.Item.FindControl("txtNome") as RadTextBox).Text.ToLower().Replace(" ", "-");
                produto.descricao = (e.Item.FindControl("txtDescricao") as RadEditor).Text;
                produto.unidade = (e.Item.FindControl("txtUnidade") as RadTextBox).Text;
                produto.codigoDeBarras = (e.Item.FindControl("txtCodigoDeBarras") as RadTextBox).Text;
                produto.referencia = (e.Item.FindControl("txtReferencia") as RadTextBox).Text;
                produto.dtCadastro = DateTime.Now;
                produto.ativo = (e.Item.FindControl("ckbAtivo") as CheckBox).Checked;
                #endregion Dados Produto

                //#region Fotos

                //var t = Request.Files;

                //var fileUpload1 = (e.Item.FindControl("FileUpload1") as FileUpload);
                //var fileUpload2 = (userControl.FindControl("FileUpload2") as FileUpload);
                //var fileUpload3 = (userControl.FindControl("FileUpload3") as FileUpload);
                //var fileUpload4 = (userControl.FindControl("FileUpload4") as FileUpload);

                //if ((fileUpload1.PostedFile.ContentLength | fileUpload2.PostedFile.ContentLength | fileUpload3.PostedFile.ContentLength | fileUpload4.PostedFile.ContentLength) > 0)
                //{
                //    var fotos = from f in data.tbprodutofotos where f.IdProduto == (int)idProduto select f;

                //    foreach (var foto in fotos)
                //    {
                //        data.tbprodutofotos.Remove(foto);
                //    }

                //    if (fileUpload1.PostedFile.ContentLength > 0)
                //    {
                //        fileUpload1.PostedFile.SaveAs(Server.MapPath("../images/produto/" + fileUpload1.FileName +
                //                                                     DateTime.Now.ToString("ddmmyyyy") +
                //                                                     Path.GetExtension(fileUpload1.PostedFile.FileName)
                //                                                         .ToLower()));

                //        var novaFoto = new tbprodutofotos
                //        {
                //            IdProduto = (int)idProduto,
                //            caminhoFoto = string.Format("/produto/{0}{1}{2}", fileUpload1.FileName, DateTime.Now.ToString("ddmmyyyy"), Path.GetExtension(fileUpload1.PostedFile.FileName)
                //                    .ToLower())
                //        };

                //        data.tbprodutofotos.Add(novaFoto);
                //    }

                //    if (fileUpload2.PostedFile.ContentLength > 0)
                //    {
                //        fileUpload2.PostedFile.SaveAs(Server.MapPath(string.Format("../images/produto/{0}{1}{2}", fileUpload2.FileName, DateTime.Now.ToString("ddmmyyyy"), Path.GetExtension(fileUpload2.PostedFile.FileName)
                //                .ToLower())));

                //        var novaFoto = new tbprodutofotos
                //        {
                //            IdProduto = (int)idProduto,
                //            caminhoFoto = "/produto/" + fileUpload2.FileName +
                //                          DateTime.Now.ToString("ddmmyyyy") +
                //                          Path.GetExtension(fileUpload2.PostedFile.FileName)
                //                              .ToLower()
                //        };

                //        data.tbprodutofotos.Add(novaFoto);
                //    }

                //    if (fileUpload3.PostedFile.ContentLength > 0)
                //    {
                //        fileUpload3.PostedFile.SaveAs(Server.MapPath(string.Format("../images/produto/{0}{1}{2}", fileUpload3.FileName, DateTime.Now.ToString("ddmmyyyy"), Path.GetExtension(fileUpload3.PostedFile.FileName)
                //                .ToLower())));

                //        var novaFoto = new tbprodutofotos
                //        {
                //            IdProduto = (int)idProduto,
                //            caminhoFoto = "/produto/" + fileUpload3.FileName +
                //                          DateTime.Now.ToString("ddmmyyyy") +
                //                          Path.GetExtension(fileUpload3.PostedFile.FileName)
                //                              .ToLower()
                //        };

                //        data.tbprodutofotos.Add(novaFoto);
                //    }

                //    if (fileUpload4.PostedFile.ContentLength > 0)
                //    {
                //        fileUpload4.PostedFile.SaveAs(Server.MapPath(string.Format("../images/produto/{0}{1}{2}", fileUpload4.FileName, DateTime.Now.ToString("ddmmyyyy"), Path.GetExtension(fileUpload4.PostedFile.FileName)
                //                .ToLower())));

                //        var novaFoto = new tbprodutofotos
                //        {
                //            IdProduto = (int)idProduto,
                //            caminhoFoto = "/produto/" + fileUpload4.FileName +
                //                          DateTime.Now.ToString("ddmmyyyy") +
                //                          Path.GetExtension(fileUpload4.PostedFile.FileName)
                //                              .ToLower()
                //        };

                //        data.tbprodutofotos.Add(novaFoto);
                //    }
                //}
                //#endregion Fotos

                data.SaveChanges();

                RadGrid1.MasterTableView.ClearEditItems();
            }
        }
        catch (Exception ex)
        {

            var lblError = new Label
            {
                Text = "Unable to insert Employees. Reason: " + ex.Message,
                ForeColor = System.Drawing.Color.Red
            };
            RadGrid1.Controls.Add(lblError);

            e.Canceled = true;
            throw;
        }



    }

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        using (var data = new criartEntities())
        {

            try
            {
                var produto = new produtos();
                produto.nome = (e.Item.FindControl("txtNome") as RadTextBox).Text;
                produto.nome_url = (e.Item.FindControl("txtNome") as RadTextBox).Text.ToLower().Replace(" ", "-");
                produto.descricao = (e.Item.FindControl("txtDescricao") as RadEditor).Text;
                produto.unidade = (e.Item.FindControl("txtUnidade") as RadTextBox).Text;
                produto.codigoDeBarras = (e.Item.FindControl("txtCodigoDeBarras") as RadTextBox).Text;
                produto.referencia = (e.Item.FindControl("txtReferencia") as RadTextBox).Text;
                produto.dtCadastro = DateTime.Now;
                produto.ativo = (e.Item.FindControl("ckbAtivo") as CheckBox).Checked;
                data.produtos.Add(produto);

                data.SaveChanges();

                RadGrid1.MasterTableView.ClearEditItems();
                RadGrid1.Rebind();
            }
            catch (Exception ex)
            {

                var lblError = new Label
                {
                    Text = "Unable to insert Employees. Reason: " + ex.Message,
                    ForeColor = System.Drawing.Color.Red
                };
                RadGrid1.Controls.Add(lblError);

                e.Canceled = true;
                throw;
            }
        }
    }

    protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
    {

    }

    protected void RadGrid1_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            DisplayMessage(true, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["idProduto"] + " cannot be updated. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage(false, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["idProduto"] + " updated");
        }
    }

    protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            e.KeepInInsertMode = true;
            DisplayMessage(true, "Employee cannot be inserted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage(false, "Employee inserted");
        }
    }

    protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.ExceptionHandled = true;
            DisplayMessage(true, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"] + " cannot be deleted. Reason: " + e.Exception.Message);
        }
        else
        {
            DisplayMessage(false, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"] + " deleted");
        }
    }

    private void DisplayMessage(bool isError, string text)
    {
        Label label = (isError) ? this.Label1 : this.Label2;
        label.Text = text;
    }

    protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
    {
        if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
        {
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGrid1.MasterTableView.GetColumn("EditCommandColumn");
            editColumn.Visible = false;
        }
        else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
        {
            e.Canceled = true;
        }
        else
        {
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGrid1.MasterTableView.GetColumn("EditCommandColumn");
            if (!editColumn.Visible)
                editColumn.Visible = true;
        }
    }

    protected void RadGrid1_ItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            HyperLink editLink = (HyperLink)e.Item.FindControl("EditLink");
            ImageButton edtiButton = (ImageButton)e.Item.FindControl("EditButton");

            edtiButton.Attributes["href"] = "javascript:void(0);";
            edtiButton.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["idProduto"], e.Item.ItemIndex);

            editLink.Attributes["href"] = "javascript:void(0);";
            editLink.Attributes["onclick"] = String.Format("return ShowEditForm('{0}','{1}');", e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["idProduto"], e.Item.ItemIndex);
        }
    }

    protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
    {
        if (e.Argument == "Rebind")
        {
            RadGrid1.MasterTableView.SortExpressions.Clear();
            RadGrid1.MasterTableView.GroupByExpressions.Clear();
            RadGrid1.Rebind();

            using (var data = new criartEntities())
            {
                RadGrid1.DataSource = (from c in data.produtos select c).ToList();
                RadGrid1.DataBind();
            }

        }
        else if (e.Argument == "RebindAndNavigate")
        {
            RadGrid1.MasterTableView.SortExpressions.Clear();
            RadGrid1.MasterTableView.GroupByExpressions.Clear();
            RadGrid1.MasterTableView.CurrentPageIndex = RadGrid1.MasterTableView.PageCount - 1;
            RadGrid1.Rebind();
        }
    }

    protected void RadAjaxManager1_AjaxSettingCreated(object sender, AjaxSettingCreatedEventArgs e)
    {
        if (e.Updated.ClientID == RadGrid1.ClientID)
        {
            e.UpdatePanel.ChildrenAsTriggers = false;
        }
    }

    [WebMethod]
    [ScriptMethod]
    public static void Idade(String foto)
    {
        //return (new Random().Next(100));

        fu1 = foto;
    }

    public object DataItem
    {
        get
        {
            return this._dataItem;
        }
        set
        {
            this._dataItem = value;
        }
    }
}