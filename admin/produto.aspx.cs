using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_produto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Banco db = new Banco();

            try
            {
                db.AbreConexao(false);
                db.ComandoSQL.CommandText = "Select * From produtos";
                DataTable dados = new DataTable();
                dados = db.ExecutaSelect();

                GridView1.DataSource = dados;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('" + ex.Message + "')", true);
            }
        }


    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        throw new NotImplementedException();
    }

    protected void GridView1_OnDataBound(object sender, EventArgs e)
    {

    }

    protected void GridView1_OnRowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ImageButton ImageButton1 = (ImageButton)e.Row.FindControl("ibtEditar");
            HiddenField hfIdProduto = (HiddenField)e.Row.FindControl("hfIdProduto");
            ImageButton1.PostBackUrl = "produtoAlt.aspx?produtoId=" + hfIdProduto.Value;
        }
    }
}