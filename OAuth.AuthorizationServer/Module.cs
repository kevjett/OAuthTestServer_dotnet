using System.Threading.Tasks;
using OAuth.AuthorizationServer.Server;
using DotNetOpenAuth.OAuth2;
using StructureMap;
using StructureMap.Configuration.DSL;

namespace OAuth.AuthorizationServer
{
    public class Module : Registry
    {
        public Module()
        {
            Scan(x =>
            {
                x.TheCallingAssembly();
                x.WithDefaultConventions();
            });

            For<IAuthorizationServerHost>().Use<AuthorizationServerHost>();
        }
    }
}
