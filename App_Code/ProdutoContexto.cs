using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProdutoContexto
/// </summary>
public class ProdutoContexto : DbContext
{

    //public DbSet<produtos> Produtos { get; set; }

    public DbSet<ProdutoSession> Produtos { get; set; }

    public DbSet<tbprodutoscategorias> Categorias { get; set; }

    public DbSet<CarrinhoItem> CarrinhoItens { get; set; }

    //public ProdutoContexto()
    //{
    //
    // TODO: Add constructor logic here
    //
    //}
}