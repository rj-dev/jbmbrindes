using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Produto
/// </summary>
public class Produto
{
    private produtos _produto;

    public produtos ProdutoDetalhes
    {
        get { return _produto; }
        set { _produto = value; }
    }

    public Produto()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}