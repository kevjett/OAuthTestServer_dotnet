using System;
using System.Security.Cryptography;
using System.Text;
using OAuth.AuthorizationServer.Server;

namespace OAuth.AuthorizationServer.Models
{
    public class OAuth_Resource
    {
        public OAuth_Resource(DbTable.OAuth_Resource resource)
        {
            Resource = resource;
        }

        public DbTable.OAuth_Resource Resource
        {
            get;
            set; 
        }

        private RSACryptoServiceProvider _publicTokenEncrypter;
        public RSACryptoServiceProvider PublicTokenEncrypter
        {
            get
            {
                if (_publicTokenEncrypter == null)
                {
                    lock (this)
                    {
                        _publicTokenEncrypter = ResourceServerKeyManager.GetDecrypter(Resource.PublicTokenEncryptionKey);
                    }
                }
                return _publicTokenEncrypter;
            }
        }
    }
}