using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Autofac;
using Autofac.Integration.Mvc;
using Autofac.Integration.WebApi;
using NHibernate;
using Zdd.Api.Infrastructure;
using Zdd.Domain;
using Zdd.Persistance;

namespace Zdd.Api.App_Start
{
    public static class DependencyConfig
    {
        public static void Register(HttpConfiguration config)
        {
            var builder = new ContainerBuilder();

            builder.RegisterGeneric(typeof (NhRepository<>))
                .As(typeof (IRepository<>))
                .InstancePerLifetimeScope();

            builder.RegisterType<AppConfiguration>().As<IAppConfiguration>();

            // ORM and repository registration
            builder.Register(x => NhConfigurator.BuildSessionFactory(x.Resolve<IAppConfiguration>()))
                .SingleInstance();
            // Register ISession as instance per web request
            builder.Register(x => x.Resolve<ISessionFactory>().OpenSession())
                .InstancePerRequest();

          
            builder.RegisterApiControllers(Assembly.GetExecutingAssembly());
              


            //// Register the Web API controllers.
            //builder.RegisterAssemblyTypes(Assembly.GetExecutingAssembly())
            //.Where(t => !t.IsAbstract && typeof(ApiController).IsAssignableFrom(t))
            //.InstancePerMatchingLifetimeScope(AutofacWebApiDependencyResolver.ApiRequestTag)
            //;


            var container = builder.Build();
            var resolver = new AutofacWebApiDependencyResolver(container);
            config.DependencyResolver = resolver;


            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));

        

        }
    }
}