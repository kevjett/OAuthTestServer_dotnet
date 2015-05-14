using System;
using System.Collections.Generic;
using System.Linq;
using OAuth.AuthorizationServer.Models;
using StructureMap.Attributes;

namespace OAuth.AuthorizationServer
{
    public interface IOAuthResourceService : IBaseService
    {
        OAuth_Resource FindWithSupportedScopes(HashSet<string> scopes);
    }

    public class OAuthResourceService : BaseService, IOAuthResourceService
    {
        public OAuthResourceService(IContext context) : base(context)
        {
        }

        public OAuth_Resource FindWithSupportedScopes(HashSet<string> scopes)
        {
            return new OAuth_Resource(UnitOfWork.OAuth_Resource.FindWithSupportedScopes(scopes));
        }
    }
}