using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

public partial class IncluirNoCarrinho : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        //var rawId = Request.QueryString["ProdutoID"];

        IList<string> Id = Request.GetFriendlyUrlSegments();

        //var rawId = Id[0];

        var rawId = RouteData.Values["produtoID"].ToString();

        int produotId;

        if (!String.IsNullOrEmpty(rawId) && Int32.TryParse(rawId, out produotId))
        {
            var usuariosCarrinhoCompras = new CarrinhoActions();

            //usuariosCarrinhoCompras.IncluirNoCarrinho(Convert.ToInt32(rawId));
            usuariosCarrinhoCompras.IncluirNoCarrinhoV2(Convert.ToInt32(rawId));
        }
        else
        {
            Debug.Fail("ERROR : Falta o produtoId para chamar IncluirNoCarrinho.aspx");

            throw new Exception("ERROR : Não se pode carregar IncluirNoCarrinho.aspx sem definir um ProdutoId.");
        }


        Response.Redirect("~/Lista");
    }
}