using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_categoriaDetalhes : System.Web.UI.UserControl
{
    private object _dataItem = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    #region Web Form Designer generated code
    override protected void OnInit(EventArgs e)
    {
        //
        // CODEGEN: This call is required by the ASP.NET Web Form Designer.
        //
        InitializeComponent();
        base.OnInit(e);
    }

    /// <summary>
    ///          Required method for Designer support - do not modify
    ///          the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.DataBinding += new System.EventHandler(this.categoriaDetalhes_DataBinding);

    }
    #endregion

    public object DataItem
    {
        get
        {
            return this._dataItem;
        }
        set
        {
            this._dataItem = value;
        }
    }

    protected void categoriaDetalhes_DataBinding(object sender, System.EventArgs e)
    {
        //ArrayList tocs = new ArrayList(new string[] { "Dr.", "Mr.", "Mrs.", "Ms." });

        //ddlTOC.DataSource = tocs;
        //ddlTOC.DataBind();

        //object tocValue = DataBinder.Eval(DataItem, "TitleOfCourtesy");

        //if (tocValue == DBNull.Value)
        //{
        //    tocValue = "Mrs.";
        //}
        //ddlTOC.SelectedIndex = tocs.IndexOf((string)tocValue);
        //ddlTOC.DataSource = null;
    }
}