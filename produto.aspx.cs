using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

public partial class produto : System.Web.UI.Page
{
    public string fotoDestaque = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            detalhesProduto();
        }

    }

    protected void detalhesProduto()
    {
        IList<string> Id = Request.GetFriendlyUrlSegments();

        int produtoId = Convert.ToInt32(Id[0]);

        using (var data = new criartEntities())
        {
            var db = new Banco();

            db.AbreConexao(false);
            db.ComandoSQL.CommandText = "SELECT p.idProduto, p.nome, (SELECT caminhoFoto FROM tbprodutofotos WHERE idProduto = p.idProduto LIMIT 1) as caminhoFoto FROM produtos p WHERE idProduto =" + produtoId;
            DataTable dadosProduto = db.ExecutaSelect();

            db.ComandoSQL.CommandText = "SELECT caminhoFoto, idProduto FROM tbprodutofotos WHERE idProduto = " + produtoId;
            DataTable fotosProduto = db.ExecutaSelect();

            //var dadosProduto = (from p in data.produtos where p.idProduto == produtoId select p).FirstOrDefault();

            //var fotosProduto = (from f in data.tbprodutofotos where f.IdProduto == produtoId select f).ToList();

            aImgZoom.HRef = ResolveUrl(fotosProduto.Rows[0]["caminhoFoto"].ToString());
            aImgZoom.Title = dadosProduto.Rows[0]["nome"].ToString();
            imgSmall.Src = fotosProduto.Rows[0]["caminhoFoto"].ToString().Insert(fotosProduto.Rows[0]["caminhoFoto"].ToString().LastIndexOf("/") + 1, "_media_" + produtoId + "_");

            rptThumbFotos.DataSource = fotosProduto;
            rptThumbFotos.DataBind();

            btnOrcamento.PostBackUrl = ResolveUrl("IncluirNaLista/" + produtoId);
        }



    }

    protected void thumbs()
    {

    }
}