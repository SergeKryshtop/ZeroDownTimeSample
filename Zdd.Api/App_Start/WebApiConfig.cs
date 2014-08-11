using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Validation.Providers;
using Zdd.Api.App_Start;
using Zdd.Api.Attributes;

namespace Zdd.Api
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Filters.Add(new NHibernateTransactionAttribute());

            DependencyConfig.Register(config);

            //config.Services.RemoveAll(
            //   typeof(System.Web.Http.Validation.ModelValidatorProvider),
            //   v => v is InvalidModelValidatorProvider);

            //config.Services.Insert(typeof(EntityModelBinderProvider), 0, new EntityModelBinderProvider());

        }
    }
}
