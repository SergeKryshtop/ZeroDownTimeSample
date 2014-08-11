using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Zdd.Api.Infrastructure
{
    public class AppConfiguration : IAppConfiguration
    {
        private const string ConnectionStringKey = "TenantConnection";

        public string ConnectionString
        {
            get { return ConfigurationManager.ConnectionStrings[ConnectionStringKey].ConnectionString; }
        }
    }
}