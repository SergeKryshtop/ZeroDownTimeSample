using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Http.Dependencies;
using Autofac;
using NHibernate;
using NHibernate.Cfg;
using NHibernate.Cfg.MappingSchema;
using NHibernate.Dialect;
using NHibernate.Mapping.ByCode;
using Zdd.Persistance.Mapping;

namespace Zdd.Api.Infrastructure
{
    public class NhConfigurator
    {
        public static ISessionFactory BuildSessionFactory(IAppConfiguration appConfig)
        {
            var cfg = new Configuration();
            cfg.SessionFactory()
                .Integrate.Using<MsSql2012Dialect>()
                .Connected.Using(appConfig.ConnectionString)
                .Schema.Validating();
            
            var mapper = new ModelMapper();
            mapper.AddMappings(typeof(OrderMap).Assembly.GetTypes()
                                                          .Where(t => t.Namespace != null && t.Namespace.StartsWith("Zdd.Persistance.Mapping")));
            HbmMapping mappings = mapper.CompileMappingForAllExplicitlyAddedEntities();

            cfg.AddMapping(mappings);
            return cfg.BuildSessionFactory();
        }


       
    }
}
