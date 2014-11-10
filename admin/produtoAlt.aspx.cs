using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

public partial class admin_produtoAlt : System.Web.UI.Page
{

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (Request.QueryString["produtoId"] == null)
        {
            DetailsView1.DefaultMode = DetailsViewMode.Insert;
        }
        else
        {
            DetailsView1.DefaultMode = DetailsViewMode.Edit;

        }
        this.Page.Title = "Editing record";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            carregaFotos();
            CarregaTreeView();
            MarcaCategorias();
        }


    }



    protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            //ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
        else if (e.CommandName == "Insert")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
        }
    }

    protected void DetailsView1_OnItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        var FileUpload1 = (FileUpload)DetailsView1.FindControl("FileUpload1");
        var FileUpload2 = (FileUpload)DetailsView1.FindControl("FileUpload2");
        var FileUpload3 = (FileUpload)DetailsView1.FindControl("FileUpload3");
        var FileUpload4 = (FileUpload)DetailsView1.FindControl("FileUpload4");


        if (FileUpload1.PostedFile.ContentLength > 0)
            e.Values["foto"] = FileUpload1.FileName +
                               Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();

        if (FileUpload2.PostedFile.ContentLength > 0)
            e.Values["foto"] = FileUpload2.FileName +
                               Path.GetExtension(FileUpload2.PostedFile.FileName).ToLower();

        if (FileUpload3.PostedFile.ContentLength > 0)
            e.Values["foto"] = FileUpload3.FileName +
                               Path.GetExtension(FileUpload3.PostedFile.FileName).ToLower();

        if (FileUpload4.PostedFile.ContentLength > 0)
            e.Values["foto"] = FileUpload4.FileName +
                               Path.GetExtension(FileUpload4.PostedFile.FileName).ToLower();
    }

    protected void DetailsView1_OnItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.AffectedRows <= 0) return;
        var FileUpload1 = (FileUpload)DetailsView1.FindControl("FileUpload1");
        var FileUpload2 = (FileUpload)DetailsView1.FindControl("FileUpload2");
        var FileUpload3 = (FileUpload)DetailsView1.FindControl("FileUpload3");
        var FileUpload4 = (FileUpload)DetailsView1.FindControl("FileUpload4");

        int produtoId = Convert.ToInt32(e.Values["idProduto"]);

        Directory.CreateDirectory(Server.MapPath("../images/produto/" + produtoId));

        if (FileUpload1 != null && FileUpload1.PostedFile.ContentLength > 0)
        {
            FileUpload1.PostedFile.SaveAs(Server.MapPath("../images/produto/" + produtoId + "/" + FileUpload1.FileName +
                                                         Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower()));

            Bitmap bmpPostedImageM = new Bitmap(FileUpload1.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + FileUpload1.FileName);

            Bitmap bmpPostedImageP = new Bitmap(FileUpload1.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + FileUpload1.FileName);
        }

        if (FileUpload2 != null && FileUpload2.PostedFile.ContentLength > 0)
        {
            FileUpload2.PostedFile.SaveAs(Server.MapPath("../images/produto/" + produtoId + "/" + FileUpload2.FileName +
                                                         Path.GetExtension(FileUpload2.PostedFile.FileName).ToLower()));

            Bitmap bmpPostedImageM = new Bitmap(FileUpload2.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + FileUpload2.FileName);

            Bitmap bmpPostedImageP = new Bitmap(FileUpload2.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + FileUpload2.FileName);
        }

        if (FileUpload3 != null && FileUpload3.PostedFile.ContentLength > 0)
        {
            FileUpload3.PostedFile.SaveAs(Server.MapPath("../images/produto/" + produtoId + "/" + FileUpload3.FileName +
                                                         Path.GetExtension(FileUpload3.PostedFile.FileName).ToLower()));

            Bitmap bmpPostedImageM = new Bitmap(FileUpload3.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + FileUpload3.FileName);

            Bitmap bmpPostedImageP = new Bitmap(FileUpload3.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + FileUpload3.FileName);
        }

        if (FileUpload4 != null && FileUpload4.PostedFile.ContentLength > 0)
        {
            FileUpload4.PostedFile.SaveAs(Server.MapPath("../images/produto/" + produtoId + "/" + FileUpload4.FileName +
                                                         Path.GetExtension(FileUpload4.PostedFile.FileName).ToLower()));

            Bitmap bmpPostedImageM = new Bitmap(FileUpload4.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + FileUpload4.FileName);

            Bitmap bmpPostedImageP = new Bitmap(FileUpload4.PostedFile.InputStream);
            rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + FileUpload4.FileName);
        }

        var ckbCategoria = ((RadTreeView)DetailsView1.FindControl("RadTreeView1")).CheckedNodes;

        using (var data = new criartEntities())
        {
            foreach (var categoria in ckbCategoria)
            {
                var inserirCategoria = new tbjuncaoprodutocategoria
                {
                    idProduto = produtoId,
                    idProdutoCategoria = Convert.ToInt32(categoria.Value)
                };
                data.tbjuncaoprodutocategoria.Add(inserirCategoria);
            }
        }
    }

    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        var FileUpload1 = (FileUpload)DetailsView1.FindControl("FileUpload1");
        var FileUpload2 = (FileUpload)DetailsView1.FindControl("FileUpload2");
        var FileUpload3 = (FileUpload)DetailsView1.FindControl("FileUpload3");
        var FileUpload4 = (FileUpload)DetailsView1.FindControl("FileUpload4");

        int produtoId = Convert.ToInt32(e.Keys[0].ToString());

        RadTextBox txtNome = (RadTextBox)DetailsView1.FindControl("txtNome");
        RadTextBox txtUnidade = (RadTextBox)DetailsView1.FindControl("txtUnidade");
        RadTextBox txtCodigoDeBarras = (RadTextBox)DetailsView1.FindControl("txtCodigoDeBarras");
        RadTextBox txtReferencia = (RadTextBox)DetailsView1.FindControl("txtReferencia");
        RadEditor txtDescricao = (RadEditor)DetailsView1.FindControl("txtDescricao");

        CheckBox ckbAtivo = (CheckBox)DetailsView1.FindControl("ckbAtivo");

        e.NewValues["nome"] = txtNome.Text;
        e.NewValues["unidade"] = txtUnidade.Text;
        e.NewValues["Ativo"] = ckbAtivo.Checked ? Convert.ToByte(1) : Convert.ToByte(0);
        e.NewValues["codigodebarras"] = txtCodigoDeBarras.Text;
        e.NewValues["referencia"] = txtReferencia.Text;
        e.NewValues["descricao"] = txtDescricao.Content;

        var checkBox1 = (CheckBox)DetailsView1.FindControl("CheckBox1");
        var checkBox2 = (CheckBox)DetailsView1.FindControl("CheckBox2");
        var checkBox3 = (CheckBox)DetailsView1.FindControl("CheckBox3");
        var checkBox4 = (CheckBox)DetailsView1.FindControl("CheckBox4");

        string idImagem = e.Keys[0].ToString();
        string pastaProduto = idImagem;
        string nomeDaFoto = "";

        List<string> fotos = new List<string>();
        List<string> fotosDeletar = new List<string>();


        var ckbCategoria = ((RadTreeView)DetailsView1.FindControl("RadTreeView1")).CheckedNodes;

        if (ckbCategoria.Count <= 0)
        {
            e.Cancel = true;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "radalert", "alert('Selecione uma categoria!');", true);
        }

        if (FileUpload1.FileName != "")
        {

            var dir = new DirectoryInfo(Server.MapPath("../images/produto/" + pastaProduto));

            if (!dir.Exists)
                Directory.CreateDirectory(Server.MapPath("../images/produto/" + pastaProduto));

            nomeDaFoto = FileUpload1.FileName.Substring(0, FileUpload1.FileName.IndexOf('.')) +
                               DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                               Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
        }

        if (checkBox1.Checked)
        {

            if (File.Exists(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg1")).Value))) ;
            {
                File.Delete(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg1")).Value));
            }

            fotosDeletar.Add(((HiddenField)DetailsView1.FindControl("hfNomeImg1")).Value);
        }
        else
        {
            if (FileUpload1.PostedFile.ContentLength > 0)
                fotos.Add(nomeDaFoto);
            else
            {
                //if (fotoOferta.ImageUrl == Server.MapPath(ConfigurationManager.AppSettings["caminhoVirtual"] + "../../db/naoExiste.jpg"))
                //    e.NewValues["foto"] = "naoExiste.jpg";
                //else
                //    e.NewValues["foto"] = nomeDaFoto;
            }
        }

        if (FileUpload2.FileName != "")
        {

            var dir = new DirectoryInfo(Server.MapPath("../images/produto/" + pastaProduto));

            if (!dir.Exists)
                Directory.CreateDirectory(Server.MapPath("../images/produto/" + pastaProduto));

            nomeDaFoto = FileUpload2.FileName.Substring(0, FileUpload2.FileName.IndexOf('.')) +
                               DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                               Path.GetExtension(FileUpload2.PostedFile.FileName).ToLower();


        }

        if (checkBox2.Checked)
        {

            if (File.Exists(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg2")).Value))) ;
            {
                File.Delete(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg2")).Value));
            }

            fotosDeletar.Add(((HiddenField)DetailsView1.FindControl("hfNomeImg2")).Value);
        }
        else
        {
            if (FileUpload2.PostedFile.ContentLength > 0)
                fotos.Add(nomeDaFoto);
            else
            {
                //if (fotoOferta.ImageUrl == Server.MapPath(ConfigurationManager.AppSettings["caminhoVirtual"] + "../../db/naoExiste.jpg"))
                //    e.NewValues["foto"] = "naoExiste.jpg";
                //else
                //    e.NewValues["foto"] = nomeDaFoto;
            }
        }

        if (FileUpload3.FileName != "")
        {
            var dir = new DirectoryInfo(Server.MapPath("../images/produto/" + pastaProduto));

            if (!dir.Exists)
                Directory.CreateDirectory(Server.MapPath("../images/produto/" + pastaProduto));

            nomeDaFoto = FileUpload3.FileName.Substring(0, FileUpload3.FileName.IndexOf('.')) +
                               DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                               Path.GetExtension(FileUpload3.PostedFile.FileName).ToLower();


        }

        if (checkBox3.Checked)
        {

            if (File.Exists(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg3")).Value))) ;
            {
                File.Delete(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg3")).Value));
            }

            fotosDeletar.Add(((HiddenField)DetailsView1.FindControl("hfNomeImg3")).Value);
        }
        else
        {
            if (FileUpload3.PostedFile.ContentLength > 0)
                fotos.Add(nomeDaFoto);
            else
            {
                //if (fotoOferta.ImageUrl == Server.MapPath(ConfigurationManager.AppSettings["caminhoVirtual"] + "../../db/naoExiste.jpg"))
                //    e.NewValues["foto"] = "naoExiste.jpg";
                //else
                //    e.NewValues["foto"] = nomeDaFoto;
            }
        }

        if (FileUpload4.FileName != "")
        {
            var dir = new DirectoryInfo(Server.MapPath("../images/produto/" + pastaProduto));

            if (!dir.Exists)
                Directory.CreateDirectory(Server.MapPath("../images/produto/" + pastaProduto));

            nomeDaFoto = FileUpload4.FileName.Substring(0, FileUpload4.FileName.IndexOf('.')) +
                               DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                               Path.GetExtension(FileUpload4.PostedFile.FileName).ToLower();

        }

        if (checkBox4.Checked)
        {

            if (File.Exists(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg4")).Value))) ;
            {
                File.Delete(Server.MapPath("../" + ((HiddenField)DetailsView1.FindControl("hfNomeImg4")).Value));
            }

            fotosDeletar.Add(((HiddenField)DetailsView1.FindControl("hfNomeImg4")).Value);
        }
        else
        {
            if (FileUpload4.PostedFile.ContentLength > 0)
                fotos.Add(nomeDaFoto);
            else
            {
                //if (fotoOferta.ImageUrl == Server.MapPath(ConfigurationManager.AppSettings["caminhoVirtual"] + "../../db/naoExiste.jpg"))
                //    e.NewValues["foto"] = "naoExiste.jpg";
                //else
                //    e.NewValues["foto"] = nomeDaFoto;
            }
        }

        using (var data = new criartEntities())
        {

            var deletaArquivos = (from f in data.tbprodutofotos where f.IdProduto == produtoId && fotosDeletar.Contains(f.caminhoFoto) select f).ToList();

            try
            {
                foreach (var arquivo in deletaArquivos)
                {
                    data.tbprodutofotos.Remove(arquivo);
                }

                foreach (var foto in fotos)
                {
                    var inserirFoto = new tbprodutofotos
                    {
                        IdProduto = produtoId,
                        caminhoFoto = "images/produto/" + pastaProduto + "/" + foto
                    };
                    data.tbprodutofotos.Add(inserirFoto);
                }

                var deletaCategorias = (from c in data.tbjuncaoprodutocategoria where c.idProduto == produtoId select c).ToList();

                foreach (var categoria in deletaCategorias)
                {
                    data.tbjuncaoprodutocategoria.Remove(categoria);
                }

                foreach (var categoria in ckbCategoria)
                {
                    var inserirCategoria = new tbjuncaoprodutocategoria
                    {
                        idProduto = produtoId,
                        idProdutoCategoria = Convert.ToInt32(categoria.Value)
                    };
                    data.tbjuncaoprodutocategoria.Add(inserirCategoria);
                }

                data.SaveChanges();

            }
            catch (Exception)
            {

            }

        }
    }

    protected void DetailsView1_OnItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            var fileUpload1 = (FileUpload)DetailsView1.FindControl("FileUpload1");
            var fileUpload2 = (FileUpload)DetailsView1.FindControl("FileUpload2");
            var fileUpload3 = (FileUpload)DetailsView1.FindControl("FileUpload3");
            var fileUpload4 = (FileUpload)DetailsView1.FindControl("FileUpload4");

            string pastaProduto = "";

            string idImagem = e.Keys[0].ToString();

            string produtoId = e.Keys[0].ToString();

            pastaProduto = idImagem;

            if (fileUpload1.PostedFile.ContentLength > 0)
            {
                fileUpload1.PostedFile.SaveAs(Server.MapPath("../images/produto/" + pastaProduto + "/") +
                                              fileUpload1.FileName.Substring(0, fileUpload1.FileName.IndexOf('.')) +
                                              DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                                              Path.GetExtension(fileUpload1.PostedFile.FileName).ToLower());

                string arquivo = Server.MapPath("../images/produto/" + pastaProduto + "/") +
                                 fileUpload1.FileName.Substring(0, fileUpload1.FileName.IndexOf('.')) +
                                 DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                                 Path.GetExtension(fileUpload1.PostedFile.FileName).ToLower();

                Bitmap bmpPostedImageM = new Bitmap(fileUpload1.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + fileUpload1.FileName);

                Bitmap bmpPostedImageP = new Bitmap(fileUpload1.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + fileUpload1.FileName);

                //rnFuncoes.ResizeImage(arquivo, "../images/produto/" + produtoId + "/media_" + produtoId, 255, 255, false);
            }

            if (fileUpload2.PostedFile.ContentLength > 0)
            {
                fileUpload2.PostedFile.SaveAs(Server.MapPath("../images/produto/" + pastaProduto + "/") +
                                              fileUpload2.FileName.Substring(0, fileUpload2.FileName.IndexOf('.')) +
                                              DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                                              Path.GetExtension(fileUpload2.PostedFile.FileName).ToLower());


                Bitmap bmpPostedImageM = new Bitmap(fileUpload2.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + fileUpload2.FileName);

                Bitmap bmpPostedImageP = new Bitmap(fileUpload2.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + fileUpload2.FileName);
            }

            if (fileUpload3.PostedFile.ContentLength > 0)
            {
                fileUpload3.PostedFile.SaveAs(Server.MapPath("../images/produto/" + pastaProduto + "/") +
                                              fileUpload3.FileName.Substring(0, fileUpload3.FileName.IndexOf('.')) +
                                              DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                                              Path.GetExtension(fileUpload3.PostedFile.FileName).ToLower());

                Bitmap bmpPostedImageM = new Bitmap(fileUpload3.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + fileUpload3.FileName);

                Bitmap bmpPostedImageP = new Bitmap(fileUpload3.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + fileUpload3.FileName);
            }

            if (fileUpload4.PostedFile.ContentLength > 0)
            {
                fileUpload4.PostedFile.SaveAs(Server.MapPath("../images/produto/" + pastaProduto + "/") +
                                              fileUpload4.FileName.Substring(0, fileUpload4.FileName.IndexOf('.')) +
                                              DateTime.Now.ToString("ddmmyyyy" + idImagem) +
                                              Path.GetExtension(fileUpload4.PostedFile.FileName).ToLower());

                Bitmap bmpPostedImageM = new Bitmap(fileUpload4.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageM, 255, 255, 80, "../images/produto/" + produtoId + "/" + "_media_" + produtoId + "_" + fileUpload4.FileName);

                Bitmap bmpPostedImageP = new Bitmap(fileUpload4.PostedFile.InputStream);
                rnFuncoes.ImageResizeSave(bmpPostedImageP, 100, 75, 80, "../images/produto/" + produtoId + "/" + "_pequena_" + produtoId + "_" + fileUpload4.FileName);
            }

            //ExibeGridOcultaDetails();

            ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
        }
    }

    protected void carregaFotos()
    {
        using (var data = new criartEntities())
        {
            int IdProduto = Convert.ToInt32(Request.QueryString["produtoId"]);
            var fotos = (from f in data.tbprodutofotos where f.IdProduto == IdProduto select f).ToList();
            int countImg = 1;

            foreach (var foto in fotos)
            {
                if (countImg == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "img1Load", "$('#img1').attr('src', '../" + foto.caminhoFoto + "');", true);
                    countImg++;
                    ((HiddenField)DetailsView1.FindControl("hfNomeImg1")).Value = foto.caminhoFoto;
                }
                else if (countImg == 2)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "img2Load", "$('#img2').attr('src', '../" + foto.caminhoFoto + "');", true);
                    countImg++;
                    ((HiddenField)DetailsView1.FindControl("hfNomeImg2")).Value = foto.caminhoFoto;
                }
                else if (countImg == 3)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "img3Load", "$('#img3').attr('src', '../" + foto.caminhoFoto + "');", true);
                    countImg++;
                    ((HiddenField)DetailsView1.FindControl("hfNomeImg3")).Value = foto.caminhoFoto;
                }
                else if (countImg == 4)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "img4Load", "$('#img4').attr('src', '../" + foto.caminhoFoto + "');", true);
                    countImg++;
                    ((HiddenField)DetailsView1.FindControl("hfNomeImg4")).Value = foto.caminhoFoto;
                }
            }
        }
    }

    private void CarregaTreeView()
    {

        ((RadTreeView)DetailsView1.FindControl("RadTreeView1")).Nodes.Clear();

        using (var data = new criartEntities())
        {
            var nivel1 = (from c in data.tbprodutoscategorias where c.idCategoriaPai == 0 select c).ToList();

            int node = 0;

            foreach (var itemPai in nivel1)
            {
                ((RadTreeView)DetailsView1.FindControl("RadTreeView1")).Nodes.Add(new RadTreeNode(itemPai.nome, itemPai.idProdutosCategorias.ToString()));

                var nivel2 = (from c in data.tbprodutoscategorias where c.idCategoriaPai == itemPai.idProdutosCategorias select c).ToList();

                foreach (var itemFilho in nivel2)
                {
                    ((RadTreeView)DetailsView1.FindControl("RadTreeView1")).Nodes.FindNodeByValue(itemPai.idProdutosCategorias.ToString()).Nodes.Add(new RadTreeNode(itemFilho.nome, itemFilho.idProdutosCategorias.ToString()));
                }
            }
        }
    }

    private void MarcaCategorias()
    {
        int produtoId = Convert.ToInt32(Request.QueryString["produtoId"]);

        using (var data = new criartEntities())
        {
            var categoriasVinculadas = (from jc in data.tbjuncaoprodutocategoria
                                        join c in data.tbprodutoscategorias on jc.idProdutoCategoria equals c.idProdutosCategorias
                                        where jc.idProduto == produtoId
                                        select c);

            var nodePai = ((RadTreeView)DetailsView1.FindControl("RadTreeView1")).Nodes;

            foreach (var categoriaVinculadas in categoriasVinculadas)
            {
                foreach (RadTreeNode node in nodePai)
                {
                    var nodesFilhos = node.Nodes;

                    if (node.Value == categoriaVinculadas.idProdutosCategorias.ToString())
                        node.Checked = true;

                    foreach (RadTreeNode nodeFilho in nodesFilhos)
                    {
                        if (nodeFilho.Value == categoriaVinculadas.idProdutosCategorias.ToString())
                            nodeFilho.Checked = true;
                    }
                }
            }
        }
    }

    protected void DetailsView1_OnModeChanging(object sender, DetailsViewModeEventArgs e)
    {

    }



}