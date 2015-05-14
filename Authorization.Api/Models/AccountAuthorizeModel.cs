using System.Collections.Generic;
using DotNetOpenAuth.OAuth2.Messages;
using OAuth.AuthorizationServer.Models;

namespace Authorization.Api.Models
{
    public class AccountAuthorizeModel
    {
        public OAuth_Client Client { get; set; }
        public List<DbTable.OAuth_Scope> Scopes { get; set; }
        public EndUserAuthorizationRequest AuthorizationRequest { get; set; }
    }
}