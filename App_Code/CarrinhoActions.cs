using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Data;
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

        //var data = new criartEntities();
        Banco db = new Banco();

        db.AbreConexao(false);
        db.ComandoSQL.CommandText = "SELECT p.idProduto, p.nome, (SELECT caminhoFoto FROM tbprodutofotos WHERE idProduto = p.idProduto LIMIT 1) as caminhoFoto FROM produtos p WHERE idProduto =" + id;
        DataTable dados = new DataTable();
        dados = db.ExecutaSelect();

        if (carrinhoItem == null)
        {
            //Cria um novo item no carrinho se não existir
            carrinhoItem = new CarrinhoItem()
            {
                ItemId = Guid.NewGuid().ToString(),
                ProdutoId = Convert.ToInt32(id),
                ProdutoNome = dados.Rows[0]["nome"].ToString(),// data.produtos.SingleOrDefault(x => x.idProduto == id).nome,
                ProdutoFoto = dados.Rows[0]["caminhoFoto"].ToString(),// data.produtos.SingleOrDefault(x => x.idProduto == id).tbprodutofotos.FirstOrDefault().caminhoFoto,
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

    public void IncluirNoCarrinhoV2(int id)
    {

        if (HttpContext.Current.Session["Carrinho"] == null)
            CriaCarrinhoDeCompras();

        var objDt = (DataTable)HttpContext.Current.Session["Carrinho"];
        bool jaIncluso = false;

        foreach (DataRow objDr in objDt.Rows)
        {
            if (Convert.ToInt32(objDr["ProdutoID"]) == id)
            {
                objDr["Quantidade"] = Convert.ToInt32(objDr["Quantidade"]) + 1;
                jaIncluso = true;
                break;
            }
        }

        if (!jaIncluso)
        {
            var db = new Banco();

            db.AbreConexao(false);
            db.ComandoSQL.CommandText = "SELECT p.idProduto, p.nome, (SELECT caminhoFoto FROM tbprodutofotos WHERE idProduto = p.idProduto LIMIT 1) as caminhoFoto FROM produtos p WHERE idProduto =" + id;
            DataTable dados = db.ExecutaSelect();

            DataRow objDr = objDt.NewRow();
            objDr["Quantidade"] = 1;
            objDr["ProdutoID"] = id;
            objDr["ProdutoNome"] = dados.Rows[0]["nome"].ToString();
            objDr["Foto"] = dados.Rows[0]["caminhoFoto"].ToString();
            objDt.Rows.Add(objDr);
        }

        HttpContext.Current.Session["Carrinho"] = objDt;
    }

    public void RemoverDoCarrinhoV2(int idProduto)
    {
        var objDt = (DataTable)HttpContext.Current.Session["Carrinho"];

        foreach (DataRow objDr in objDt.Rows)
        {
            if (Convert.ToInt32(objDr["ProdutoID"]) == idProduto)
            {
                objDt.Rows.Remove(objDr);
                break;
            }
        }
    }

    public void CriaCarrinhoDeCompras()
    {
        var objDt = new DataTable("Carrinho");
        objDt.Columns.Add("Codigo", typeof(Int32));
        objDt.Columns["Codigo"].AutoIncrement = true;
        objDt.Columns["Codigo"].AutoIncrementSeed = 1;

        objDt.Columns.Add("Quantidade", typeof(Int32));
        objDt.Columns.Add("ProdutoID", typeof(Int32));
        objDt.Columns.Add("ProdutoNome", typeof(String));
        objDt.Columns.Add("Foto", typeof(String));

        HttpContext.Current.Session["Carrinho"] = objDt;
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

        return _db.CarrinhoItens.Where(c => c.CarrinhoId == CarrinhoId).ToList();
    }

    public DataTable GetCarrinhoItemsV2()
    {
        return (DataTable) HttpContext.Current.Session["Carrinho"];
    }

    //public CarrinhoActions()
    //{
    //
    // TODO: Add constructor logic here
    //
    //}
}