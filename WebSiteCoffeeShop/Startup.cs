using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebSiteCoffeeShop.Startup))]
namespace WebSiteCoffeeShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
