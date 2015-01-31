using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_categorias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CarregaTreeView();
    }

    protected void RadTreeView1_OnNodeClick(object sender, RadTreeNodeEventArgs e)
    {
        int idCategoria = Convert.ToInt32(e.Node.Value);

        Banco db = new Banco();

        db.ComandoSQL.CommandText = "Select * From tbprodutoscategorias Where idCategoriaPai = " + idCategoria;
        DataTable nivel1 = new DataTable();
        nivel1 = db.ExecutaSelect();

        GridView1.DataSource = nivel1;
        GridView1.DataBind();
        //this.Employees.PrimaryKey = new DataColumn[] { this.Employees.Columns["EmployeeID"] };    


        Session["idCategoriaPaiSelecionada"] = idCategoria;
    }

    private void CarregaTreeView()
    {
        RadTreeView1.Nodes.Clear();
        tvCategorias.Nodes.Clear();

        //using (var data = new criartEntities())
        //{
        Banco db = new Banco();
        Banco db2 = new Banco();
        int node = 0;

        try
        {
            db.AbreConexao(false);
            db.ComandoSQL.CommandText = "Select * From tbprodutoscategorias Where idCategoriaPai = 0";
            DataTable nivel1 = new DataTable();
            nivel1 = db.ExecutaSelect();

            tvCategorias.Nodes.Add(new TreeNode("Categorias", "0"));

            db2.AbreConexao(false);

            foreach (DataRow itemPai in nivel1.Rows)
            {
                RadTreeView1.Nodes.Add(new RadTreeNode(itemPai[2].ToString(), itemPai[0].ToString()));
                TreeNode nodePai = new TreeNode(itemPai[2].ToString(), itemPai[0].ToString());
                tvCategorias.Nodes.Add(nodePai);

                db.ComandoSQL.CommandText = "Select * From tbprodutoscategorias Where idCategoriaPai = " + itemPai[0];
                DataTable nivel2 = new DataTable();
                nivel2 = db.ExecutaSelect();

                foreach (DataRow itemFilho in nivel2.Rows)
                {
                    TreeNode nodeFilho = new TreeNode(itemFilho[2].ToString(), itemFilho[0].ToString());
                    nodePai.ChildNodes.Add(nodeFilho);
                    RadTreeView1.Nodes.FindNodeByValue(itemPai[0].ToString()).Nodes.Add(new RadTreeNode(itemFilho[2].ToString(), itemFilho[0].ToString()));
                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "alert('" + ex.Message + "')", true);
        }
        //}
    }

    protected void tvCategorias_OnSelectedNodeChanged(object sender, EventArgs e)
    {
        int idCategoria = Convert.ToInt32(tvCategorias.SelectedNode.Value);
        SqlDataSource1.SelectParameters[0].DefaultValue = idCategoria.ToString();

        //GridView1.DataSource = nivel1;
        GridView1.DataBind();
        //this.Employees.PrimaryKey = new DataColumn[] { this.Employees.Columns["EmployeeID"] };    


        Session["idCategoriaPaiSelecionada"] = idCategoria;
    }
}