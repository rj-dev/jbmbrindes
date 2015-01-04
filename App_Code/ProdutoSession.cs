using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProdutoSession
/// </summary>
public class ProdutoSession
{
    [Key]
    public int idProduto
    {
        get { return m_ProdutoId; }
        set { m_ProdutoId = value; }
    }

    private int m_ProdutoId;

    public string nome
    {
        get { return m_nome; }
        set { m_nome = value; }
    }

    private string m_nome;

    public string nome_url
    {
        get { return m_nome_url; }
        set { m_nome_url = value; }
    }

    private string m_nome_url;

    public string unidade
    {
        get { return m_unidade; }
        set { m_unidade = value; }
    }

    private string m_unidade;

    public string codigoDeBarras
    {
        get { return m_codigoDeBarras; }
        set { m_codigoDeBarras = value; }
    }

    private string m_codigoDeBarras;

    public string referencia
    {
        get { return m_referencia; }
        set { m_referencia = value; }
    }

    private string m_referencia;

    public DateTime dataCadastro
    {
        get { return m_dataCadastro; }
        set { m_dataCadastro = value; }
    }


    private DateTime m_dataCadastro;

    public bool ativo
    {
        get { return m_ativo; }
        set { m_ativo = value; }
    }


    private bool m_ativo;

    public ProdutoSession()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}