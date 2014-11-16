using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Thumb
{

    /// <summary>
    /// Cria uma imagem em miniatura de uma especificação de arquivo na URL chamada.
    /// </summary>
    public partial class Miniatura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, System.EventArgs e)
        {
            // obter o nome do arquivo
            string st_Arquivo = Request.QueryString["arquivo"];
            int tWidth;
            int tHeight;


            if (!Int32.TryParse(Request.QueryString["w"], out tWidth))
                return;

            if (!Int32.TryParse(Request.QueryString["h"], out tHeight))
                return;

            // cria um objeto de imagem, usando o nome do arquivo que acabamos de recuperar
            System.Drawing.Image imagem = System.Drawing.Image.FromFile(Server.MapPath(st_Arquivo));

           

            // criar a imagem em miniatura
            System.Drawing.Image MiniImage = imagem.GetThumbnailImage(tWidth, tHeight, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);

            // fazer um fluxo de memória para trabalhar com os bytes da imagem
            MemoryStream StreamImagem = new MemoryStream();

            // colocar a imagem para o fluxo de memória
            MiniImage.Save(StreamImagem, System.Drawing.Imaging.ImageFormat.Jpeg);

            // fazer matriz de bytes do mesmo tamanho que a imagem
            byte[] ArquivoImagem = new Byte[StreamImagem.Length];

            // rebobinar o fluxo de memória
            StreamImagem.Position = 0;

            // carregar o array de bytes com a imagem
            StreamImagem.Read(ArquivoImagem, 0, (int)StreamImagem.Length);

            // retornar array de bytes ao interlocutor com o tipo de imagem
            Response.ContentType = "image/jpeg";
            Response.BinaryWrite(ArquivoImagem);
        }

        /// <summary>
        /// Necessário, mas não utilizados
        /// </summary>
        /// <returns>true</returns>
        public bool ThumbnailCallback()
        {
            return true;
        }

    }
}