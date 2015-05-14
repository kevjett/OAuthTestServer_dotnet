using System;
using System.Collections.Generic;
using System.Linq;
using OAuth.AuthorizationServer.Models;

namespace OAuth.AuthorizationServer
{
    public interface IOAuthClientService : IBaseService
    {
        OAuth_Client GetClient(string clientIdentifier);
    }

    public class OAuthClientService : BaseService, IOAuthClientService
    {
        public OAuthClientService(IContext context) : base(context)
        {
        }

        public OAuth_Client GetClient(string clientIdentifier)
        {
            var client = new OAuth_Client(UnitOfWork.OAuth_Client.SingleByClientIdentifier(clientIdentifier));

            if (client.Client == null)
                return null;

            client.Scopes = UnitOfWork.OAuth_Scope.GetScopesByClient(clientIdentifier);

            return client;
        }
    }
}