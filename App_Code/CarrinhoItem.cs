using System;
using System.ComponentModel.DataAnnotations;
using System.ServiceModel.Configuration;

/// <summary>
/// Summary description for CarrinhoItem
/// </summary>
public class CarrinhoItem
{
    [Key]
    public string ItemId
    {
        get { return m_ItemId; }
        set { m_ItemId = value; }
    }


    private string m_ItemId;

    public string CarrinhoId
    {

        get { return m_CarrinhoId; }
        set { m_CarrinhoId = value; }
    }

    private string m_CarrinhoId;


    public int Quantidade
    {
        get { return m_Quantidade; }
        set { m_Quantidade = value; }
    }

    private int m_Quantidade;

    public DateTime DataCriacao
    {
        get { return m_DataCriacao; }
        set { m_DataCriacao = value; }
    }

    private DateTime m_DataCriacao;

    public int ProdutoId
    {
        get { return m_ProdutoId; }
        set { m_ProdutoId = value; }
    }

    private int m_ProdutoId;

    public produtos Produto
    {
        get { return m_Produto; }
        set { m_Produto = value; }
    }

    private produtos m_Produto;

    public string ProdutoNome
    {
        get { return m_ProdutoNome; }
        set { m_ProdutoNome = value; }
    }

    private string m_ProdutoNome;

    public string ProdutoFoto
    {
        get { return m_ProdutoFoto; }
        set { m_ProdutoFoto = value; }
    }

    private string m_ProdutoFoto;

    //public CarrinhoItem()
    //{
    //
    // TODO: Add constructor logic here
    //
    //}

}