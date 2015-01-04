using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class controles_ucMenuCategoria : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Banco db = new Banco();

        try
        {
            db.AbreConexao(false);
            db.ComandoSQL.CommandText = "Select * FROM vwCategoriasSite";
            rptCategoria.DataSource = db.ExecutaSelect();
            rptCategoria.DataBind();
        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('" + ex.Message + "')", true);
        }

        //using (var data = new criartEntities())
        //{
        //    var categorias = (from c in data.tbprodutoscategorias
        //                      where c.ativa == true && c.idCategoriaPai == 0
        //                      select new
        //                          {
        //                              c.idProdutosCategorias,
        //                              c.nome,
        //                              c.nome_url,
        //                              subcategorias = (from s in data.tbprodutoscategorias where s.idCategoriaPai == c.idProdutosCategorias select s).Count()
        //                          });

        //    rptCategoria.DataSource = categorias.ToList();
        //    rptCategoria.DataBind();
        //}
    }

    protected void rptCategoria_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var rptCategoriaFilha = (Repeater)e.Item.FindControl("rptCategoriaFilha");
        var idCategoriaPai = Convert.ToInt32(((HiddenField)e.Item.FindControl("hfIdCategoria")).Value);
        var hfNomeUrl = (HiddenField)e.Item.FindControl("hfNomeUrl");
        var litMenuFilhaTopo = (Literal)e.Item.FindControl("litMenuFilhaTopo");
        var litMenuFilhaRodape = (Literal)e.Item.FindControl("litMenuFilhaRodape");

        Banco db = new Banco();

        try
        {
            db.AbreConexao(false);
            db.ComandoSQL.CommandText = "selCategoriasFilhas";
            db.ComandoSQL.CommandType = CommandType.StoredProcedure;
            db.ComandoSQL.Parameters.AddWithValue("_idCategoriaPai", idCategoriaPai);

            DataTable dados = new DataTable();
            dados = db.ExecutaSelect();

            if (dados.Rows.Count > 0)
            {
                litMenuFilhaTopo.Text = "<div id=\"" + hfNomeUrl.Value + e.Item.ItemIndex + "\" class=\"panel-collapse collapse\" style=\"height: 0px;\">" +
                                           "<div class=\"panel-body\">" +
                                               "<ul>";

                litMenuFilhaRodape.Text = "</ul></div></div>";
            }
            rptCategoriaFilha.DataSource = dados;
            rptCategoriaFilha.DataBind();

        }
        catch (Exception ex)
        {

            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('" + ex.Message + "')", true);
        }

        //using (var data = new criartEntities())
        //{
        //    var categoriaFilha = (from c in data.tbprodutoscategorias where c.ativa == true && c.idCategoriaPai == idCategoriaPai select c);

        //    if (categoriaFilha.Any())
        //    {
        //        litMenuFilhaTopo.Text = "<div id=\"" + hfNomeUrl.Value + e.Item.ItemIndex + "\" class=\"panel-collapse collapse\" style=\"height: 0px;\">" +
        //                                   "<div class=\"panel-body\">" +
        //                                       "<ul>";

        //        litMenuFilhaRodape.Text = "</ul></div></div>";
        //    }

        //    rptCategoriaFilha.DataSource = categoriaFilha.ToList();
        //    rptCategoriaFilha.DataBind();
        //}
    }
}