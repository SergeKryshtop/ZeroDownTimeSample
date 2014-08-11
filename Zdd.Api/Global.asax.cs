using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.Validation.Providers;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Zdd.Api.App_Start;
using Zdd.Api.ModelBinders;
using ModelBinderProviders = System.Web.ModelBinding.ModelBinderProviders;

namespace Zdd.Api
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
          
            var config = GlobalConfiguration.Configuration;

            GlobalConfiguration.Configure(WebApiConfig.Register);

            AutoMapperConfig.Configure();
         
        }

       
    }
}
