using System;
using System.Collections.Generic;
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
            var dadosProduto = (from p in data.produtos where p.idProduto == produtoId select p).FirstOrDefault();

            var fotosProduto = (from f in data.tbprodutofotos where f.IdProduto == produtoId select f).ToList();

            aImgZoom.HRef = ResolveUrl(fotosProduto.FirstOrDefault().caminhoFoto);
            aImgZoom.Title = dadosProduto.nome;
            imgSmall.Src = fotosProduto.FirstOrDefault().caminhoFoto.Insert(fotosProduto.FirstOrDefault().caminhoFoto.LastIndexOf("/") + 1, "_media_" + produtoId + "_");

            rptThumbFotos.DataSource = fotosProduto;
            rptThumbFotos.DataBind();
        }



    }

    protected void thumbs()
    {

    }
}