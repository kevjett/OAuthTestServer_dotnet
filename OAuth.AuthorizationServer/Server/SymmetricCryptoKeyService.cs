using System;
using System.Collections.Generic;
using System.Linq;
using DotNetOpenAuth.Messaging.Bindings;

namespace OAuth.AuthorizationServer.Server
{
    public interface ISymmetricCryptoKeyService : IBaseService, ICryptoKeyStore
    {
        
    }

    public class SymmetricCryptoKeyService : BaseService, ISymmetricCryptoKeyService
    {
        public SymmetricCryptoKeyService(IContext context) : base(context)
        {
        }

        public CryptoKey GetKey(string bucket, string handle)
        {
            var keys = UnitOfWork.OAuth_SymmetricCryptoKey.All().Where(k => k.Bucket == bucket && k.Handle == handle).ToList();
            // Perform a case senstive match
            IEnumerable<CryptoKey> matches = from key in keys
                                             where string.Equals(key.Bucket, bucket, StringComparison.Ordinal)
                                             && string.Equals(key.Handle, handle, StringComparison.Ordinal)
                                             select new CryptoKey(key.Secret, key.ExpiresDate.ToUniversalTime());
            return matches.FirstOrDefault();
        }

        public IEnumerable<KeyValuePair<string, CryptoKey>> GetKeys(string bucket)
        {
            var keys = UnitOfWork.OAuth_SymmetricCryptoKey.All().Where(key => key.Bucket == bucket).OrderByDescending(x => x.ExpiresDate).ToList()
                .Select(key => new KeyValuePair<string, CryptoKey>(key.Handle, new CryptoKey(key.Secret, key.ExpiresDate.ToUniversalTime())));
            return keys.ToList();
        }

        public void StoreKey(string bucket, string handle, CryptoKey key)
        {
            var keyRow = new DbTable.OAuth_SymmetricCryptoKey
            {
                Bucket = bucket,
                Handle = handle,
                Secret = key.Key,
                ExpiresDate = key.ExpiresUtc
            };

            UnitOfWork.OAuth_SymmetricCryptoKey.Insert(keyRow);
        }

        public void RemoveKey(string bucket, string handle)
        {
            var match = UnitOfWork.OAuth_SymmetricCryptoKey.All().FirstOrDefault(k => k.Bucket == bucket && k.Handle == handle);
            if (match != null)
            {
                UnitOfWork.OAuth_SymmetricCryptoKey.Delete(match);
            }
        }
    }
}