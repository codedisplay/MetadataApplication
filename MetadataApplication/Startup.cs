using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MetadataApplication.Startup))]
namespace MetadataApplication
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
