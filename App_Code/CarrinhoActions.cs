using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarrinhoActions
/// </summary>
public class CarrinhoActions
{
    public string CarrinhoId
    {
        get { return m_CarrinhoId; }
        set { m_CarrinhoId = value; }
    }

    private string m_CarrinhoId;
    private ProdutoContexto _db = new ProdutoContexto();
    public const string CarrinhoSessaoChave = "CarrinhoId";



    public void IncluirNoCarrinho(int id)
    {
        //Retorna o produto do banco de dados
        CarrinhoId = GetCarrinhoId();

        //var carrinhoItem = _db.CarrinhoItens.SingleOrDefault(Function(c) c.CarrinhoId = CarrinhoId AndAlso c.ProdutoId = id);

        var carrinhoItem = _db.CarrinhoItens.SingleOrDefault(x => x.CarrinhoId == CarrinhoId && x.ProdutoId == id);

        var data = new criartEntities();

        if (carrinhoItem == null)
        {
            //Cria um novo item no carrinho se não existir
            carrinhoItem = new CarrinhoItem()
            {
                ItemId = Guid.NewGuid().ToString(),
                ProdutoId = Convert.ToInt32(id),
                ProdutoNome = data.produtos.SingleOrDefault(x => x.idProduto == id).nome,
                ProdutoFoto = data.produtos.SingleOrDefault(x => x.idProduto == id).tbprodutofotos.FirstOrDefault().caminhoFoto,
                CarrinhoId = CarrinhoId,
                Produto = _db.Produtos.SingleOrDefault(x => x.idProduto == id),
                //Produto = data.produtos.SingleOrDefault(x => x.idProduto == id),
                //Produto = data.produtos.SingleOrDefault(x => x.idProduto == id),
                Quantidade = 1,
                DataCriacao = DateTime.Now
            };


            _db.CarrinhoItens.Add(carrinhoItem);
        }
        else
        {
            //se o item não existe acrescenta um unidade
            carrinhoItem.Quantidade += 1;
        }

        _db.SaveChanges();
    }

    public string GetCarrinhoId()
    {

        if (HttpContext.Current.Session[CarrinhoSessaoChave] == null)
        {
            if (!String.IsNullOrEmpty(HttpContext.Current.User.Identity.Name))
            {
                HttpContext.Current.Session[CarrinhoSessaoChave] = HttpContext.Current.User.Identity.Name;
            }
            else
            {
                //Gera um novo GUID aleatorio usado usando a classe System.Guid
                var tempCartId = Guid.NewGuid();

                HttpContext.Current.Session[CarrinhoSessaoChave] = tempCartId.ToString();
            }
        }

        return HttpContext.Current.Session[CarrinhoSessaoChave].ToString();

    }

    public List<CarrinhoItem> GetCarrinhoItems()
    {
        CarrinhoId = GetCarrinhoId();

        return _db.CarrinhoItens.Where(c => c.CarrinhoId == CarrinhoId).
        ToList();
    }

    //public CarrinhoActions()
    //{
    //
    // TODO: Add constructor logic here
    //
    //}
}