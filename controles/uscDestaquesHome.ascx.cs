using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class controles_uscDestaquesHome : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaDestaquesHome();
    }

    private void CarregaDestaquesHome()
    {
        using (var data = new criartEntities())
        {
            var destaques = (from p in data.produtos
                             join f in data.tbprodutofotos on p.idProduto equals f.IdProduto into foto
                             where p.ativo == true
                             select new { p.idProduto, p.nome, p.nome_url, foto.FirstOrDefault().caminhoFoto });

            rptDestaquesHome.DataSource = destaques.ToList().OrderBy(x => Guid.NewGuid()).Take(6);
            rptDestaquesHome.DataBind();
        }
    }
}