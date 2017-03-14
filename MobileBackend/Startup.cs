using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MobileBackend.Startup))]
namespace MobileBackend
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
