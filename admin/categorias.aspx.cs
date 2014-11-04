using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

using Telerik.Web.UI;


public partial class admin_categorias : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var t = Request.GetFriendlyUrlSegments();
            string productName = Page.RouteData.Values["anything"] as string;
            //RadGrid1.MasterTableView.EditMode = (GridEditMode)Enum.Parse(typeof(GridEditMode), RadioButtonList1.SelectedValue);
            CarregaTreeView();
        }
    }

    protected void RadGrid1_PreRender(object sender, System.EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (this.RadGrid1.MasterTableView.Items.Count > 0)
            {
                //this.RadGrid1.MasterTableView.Items[0].Edit = true;
                this.RadGrid1.MasterTableView.Rebind();
            }

        }
    }

    protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
    {
        using (var data = new criartEntities())
        {
            this.RadGrid1.DataSource = (from c in data.tbprodutoscategorias where c.idCategoriaPai == 0 select c).ToList();
            //this.Employees.PrimaryKey = new DataColumn[] { this.Employees.Columns["EmployeeID"] };    
        }

    }

    protected void RadGrid1_UpdateCommand(object source, GridCommandEventArgs e)
    {
        GridEditableItem editedItem = e.Item as GridEditableItem;
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        var idCategoria = editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["idProdutosCategorias"];

        using (var data = new criartEntities())
        {
            var categoria = (from c in data.tbprodutoscategorias
                             where c.idProdutosCategorias == (int)idCategoria
                             select c).FirstOrDefault();

            categoria.nome = (userControl.FindControl("txtNome") as TextBox).Text;
            categoria.idCategoriaPai = String.IsNullOrEmpty((userControl.FindControl("txtCategoriaPai") as TextBox).Text)
               ? 0
               : Convert.ToInt32((userControl.FindControl("txtCategoriaPai") as TextBox).Text);
            categoria.nome = (userControl.FindControl("txtNome") as TextBox).Text;
            categoria.nome_url = (userControl.FindControl("txtNome") as TextBox).Text.ToLower().Replace(" ", "-");
            categoria.ativa = (userControl.FindControl("ckbAtiva") as CheckBox).Checked;
            categoria.ordem = String.IsNullOrEmpty((userControl.FindControl("txtOrdem") as TextBox).Text)
                ? 99
                : Convert.ToInt32((userControl.FindControl("txtOrdem") as TextBox).Text);
            data.SaveChanges();
        }

        //Prepare new row to add it in the DataSource

        //DataRow[] changedRows = this.Employees.Select("EmployeeID = " + editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["idProdutosCategorias"]);

        //if (changedRows.Length != 1)
        //{
        //    RadGrid1.Controls.Add(new LiteralControl("Unable to locate the Employee for updating."));
        //    e.Canceled = true;
        //    return;
        //}

        //Update new values
        //Hashtable newValues = new Hashtable();

        //newValues["Country"] = (userControl.FindControl("TextBox7") as TextBox).Text;
        //newValues["City"] = (userControl.FindControl("TextBox8") as TextBox).Text;
        //newValues["Region"] = (userControl.FindControl("TextBox9") as TextBox).Text;
        //newValues["HomePhone"] = (userControl.FindControl("HomePhoneBox") as RadMaskedTextBox).Text;
        //newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
        //newValues["TitleOfCourtesy"] = (userControl.FindControl("ddlTOC") as DropDownList).SelectedItem.Value;

        //newValues["Notes"] = (userControl.FindControl("TextBox1") as TextBox).Text;
        //newValues["Address"] = (userControl.FindControl("TextBox6") as TextBox).Text;
        //newValues["FirstName"] = (userControl.FindControl("TextBox2") as TextBox).Text;
        //newValues["LastName"] = (userControl.FindControl("TextBox3") as TextBox).Text;
        //newValues["HireDate"] = (userControl.FindControl("HireDatePicker") as RadDatePicker).SelectedDate.ToString();
        //newValues["Title"] = (userControl.FindControl("TextBox4") as TextBox).Text;

        ////changedRows[0].BeginEdit();
        //try
        //{
        //    foreach (DictionaryEntry entry in newValues)
        //    {
        //        //changedRows[0][(string)entry.Key] = entry.Value;
        //    }
        //    //changedRows[0].EndEdit();
        //    //this.Employees.AcceptChanges();
        //}
        //catch (Exception ex)
        //{
        //    //changedRows[0].CancelEdit();

        //    Label lblError = new Label();
        //    lblError.Text = "Unable to update Employees. Reason: " + ex.Message;
        //    lblError.ForeColor = System.Drawing.Color.Red;
        //    RadGrid1.Controls.Add(lblError);

        //    e.Canceled = true;
        //}
    }

    protected void RadGrid1_InsertCommand(object source, GridCommandEventArgs e)
    {
        UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

        //Create new row in the DataSource
        //DataRow newRow = this.Employees.NewRow();

        //Insert new values
        //Hashtable newValues = new Hashtable();

        using (var data = new criartEntities())
        {

            var categoria = new tbprodutoscategorias();
            categoria.idCategoriaPai = Session["idCategoriaPaiSelecionada"] != null ? Convert.ToInt32(Session["idCategoriaPaiSelecionada"]) : String.IsNullOrEmpty((userControl.FindControl("txtCategoriaPai") as TextBox).Text)
                ? 0 : Convert.ToInt32((userControl.FindControl("txtCategoriaPai") as TextBox).Text);
            categoria.nome = (userControl.FindControl("txtNome") as TextBox).Text;
            categoria.nome_url = (userControl.FindControl("txtNome") as TextBox).Text.ToLower().Replace(" ", "-");
            categoria.ativa = (userControl.FindControl("ckbAtiva") as CheckBox).Checked;
            categoria.ordem = String.IsNullOrEmpty((userControl.FindControl("txtOrdem") as TextBox).Text)
                ? 99
                : Convert.ToInt32((userControl.FindControl("txtOrdem") as TextBox).Text);

            data.tbprodutoscategorias.Add(categoria);

            try
            {
                data.SaveChanges();
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

        Session["idCategoriaPaiSelecionada"] = null;

        CarregaTreeView();

        //newValues["Country"] = (userControl.FindControl("TextBox7") as TextBox).Text;
        //newValues["City"] = (userControl.FindControl("TextBox8") as TextBox).Text;
        //newValues["Region"] = (userControl.FindControl("TextBox9") as TextBox).Text;
        //newValues["HomePhone"] = (userControl.FindControl("HomePhoneBox") as RadMaskedTextBox).Text;
        //newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
        //newValues["TitleOfCourtesy"] = (userControl.FindControl("ddlTOC") as DropDownList).SelectedItem.Value;

        //newValues["Notes"] = (userControl.FindControl("TextBox1") as TextBox).Text;
        //newValues["Address"] = (userControl.FindControl("TextBox6") as TextBox).Text;
        //newValues["FirstName"] = (userControl.FindControl("TextBox2") as TextBox).Text;
        //newValues["LastName"] = (userControl.FindControl("TextBox3") as TextBox).Text;
        //newValues["HireDate"] = (userControl.FindControl("HireDatePicker") as RadDatePicker).SelectedDate.ToString();
        //newValues["Title"] = (userControl.FindControl("TextBox4") as TextBox).Text;

        //make sure that unique primary key value is generated for the inserted row
        //newValues["EmployeeID"] = (int)this.Employees.Rows[this.Employees.Rows.Count - 1]["EmployeeID"] + 1;
        //try
        //{
        //    //foreach (DictionaryEntry entry in newValues)
        //    //{
        //    //newRow[(string)entry.Key] = entry.Value;
        //    //}
        //    //this.Employees.Rows.Add(newRow);
        //    //this.Employees.AcceptChanges();
        //}
        //catch (Exception ex)
        //{
        //    var lblError = new Label
        //    {
        //        Text = "Unable to insert Employees. Reason: " + ex.Message,
        //        ForeColor = System.Drawing.Color.Red
        //    };
        //    RadGrid1.Controls.Add(lblError);

        //    e.Canceled = true;
        //}
    }

    protected void RadGrid1_DeleteCommand(object source, GridCommandEventArgs e)
    {
        string ID = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"].ToString();
        //DataTable employeeTable = this.Employees;
        //if (employeeTable.Rows.Find(ID) != null)
        //{
        //    employeeTable.Rows.Find(ID).Delete();
        //    employeeTable.AcceptChanges();
        //}
    }

    private void CarregaTreeView()
    {
        RadTreeView1.Nodes.Clear();

        using (var data = new criartEntities())
        {
            var nivel1 = (from c in data.tbprodutoscategorias where c.idCategoriaPai == 0 select c).ToList();

            int node = 0;

            foreach (var itemPai in nivel1)
            {
                RadTreeView1.Nodes.Add(new RadTreeNode(itemPai.nome, itemPai.idProdutosCategorias.ToString()));

                var nivel2 = (from c in data.tbprodutoscategorias where c.idCategoriaPai == itemPai.idProdutosCategorias select c).ToList();

                foreach (var itemFilho in nivel2)
                {
                    RadTreeView1.Nodes.FindNodeByValue(itemPai.idProdutosCategorias.ToString()).Nodes.Add(new RadTreeNode(itemFilho.nome, itemFilho.idProdutosCategorias.ToString()));
                }
            }
        }
    }

    protected void RadGrid1_OnItemCreated(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem item = (GridDataItem)e.Item;
            CheckBox chk = (CheckBox)item["ativa"].Controls[0];
            chk.Enabled = true;
        }
    }


    protected void RadTreeView1_OnNodeClick(object sender, RadTreeNodeEventArgs e)
    {
        int idCategoria = Convert.ToInt32(e.Node.Value);

        using (var data = new criartEntities())
        {
            this.RadGrid1.DataSource = (from c in data.tbprodutoscategorias where c.idCategoriaPai == idCategoria select c).ToList();
            this.RadGrid1.Rebind();
            //this.Employees.PrimaryKey = new DataColumn[] { this.Employees.Columns["EmployeeID"] };    
        }

        Session["idCategoriaPaiSelecionada"] = idCategoria;
    }
}