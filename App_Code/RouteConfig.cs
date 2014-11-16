using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace criart
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.EnableFriendlyUrls();

            routes.MapPageRoute("Lista", "Lista", "~/Carrinho.aspx");

            routes.MapPageRoute("IncluirNaLista", "IncluirNaLista/{produtoID}", "~/IncluirNoCarrinho.aspx");
        }
    }
}