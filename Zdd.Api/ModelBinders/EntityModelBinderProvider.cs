using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using System.Web.Mvc;
using Zdd.Domain.Models;
using IModelBinder = System.Web.Http.ModelBinding.IModelBinder;

namespace Zdd.Api.ModelBinders
{
    public class EntityModelBinderProvider : ModelBinderProvider
    {
        public override IModelBinder GetBinder(HttpConfiguration actionContext, Type modelType)
        {
            if (!typeof(IEntity).IsAssignableFrom(modelType))
                return null;

            Type modelBinderType = typeof(EntityModelBinder<>)
                .MakeGenericType(modelType);

            var modelBinder = DependencyResolver.Current.GetService(modelBinderType);

            return (IModelBinder)modelBinder;
        }
    }
}