using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class controles_usrDestaquesHomeTab : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MontaTabs();
    }

    private void MontaTabs()
    {
        Banco db = new Banco();

        try
        {
            db.AbreConexao(false);
            db.ComandoSQL.CommandText = "Select * FROM vwDestaquesHomeTabs";
            rptTabs.DataSource = db.ExecutaSelect();
            rptTabs.DataBind();
            db.FechaConexao();
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('" + ex.Message + "')", true);
        }
    }

    protected void rptTabs_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        rptPanelTab.DataSource = rptTabs.DataSource;
        rptPanelTab.DataBind();

    }

    protected void rptPanelTab_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Banco db = new Banco();

        var rptConteudoTab = (Repeater)e.Item.FindControl("rptConteudoTab");
        HiddenField hfIdCategoria = (HiddenField)e.Item.FindControl("hfIdCategoria");

        db.AbreConexao(false);
        db.ComandoSQL.CommandText = "selProdutosCategoriaHomeTab";
        db.ComandoSQL.CommandType = CommandType.StoredProcedure;
        db.ComandoSQL.Parameters.AddWithValue("idCategoria", hfIdCategoria.Value);
        rptConteudoTab.DataSource = db.ExecutaSelect();
        rptConteudoTab.DataBind();
        db.FechaConexao();

    }
}