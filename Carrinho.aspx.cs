using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Carrinho : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AtualizaCarrinho();
    }

    public List<CarrinhoItem> GetCarrinhoItens()
    {
        var actions = new CarrinhoActions();

        return actions.GetCarrinhoItems();
    }

    public DataTable GetCarrinhoItensV2()
    {
        var actions = new CarrinhoActions();
        return actions.GetCarrinhoItemsV2();
    }

    protected void AtualizaCarrinho()
    {
        CarrinhoLista.DataSource = GetCarrinhoItensV2();
        CarrinhoLista.DataBind();
    }

    protected void CarrinhoLista_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        var actions = new CarrinhoActions();
        actions.RemoverDoCarrinhoV2(Convert.ToInt32(e.CommandArgument));

        AtualizaCarrinho();
    }
}