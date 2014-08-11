using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.ModelBinding;
using Zdd.Domain;
using Zdd.Domain.Models;

namespace Zdd.Api.ModelBinders
{
    public class EntityModelBinder<TEntity> : IModelBinder where TEntity : class, IEntity
    {
        private readonly IRepository<TEntity> _repository;

        public EntityModelBinder(IRepository<TEntity> repository)
        {
            _repository = repository;
        }

        public bool BindModel(HttpActionContext actionContext, ModelBindingContext bindingContext)
        {
            var idRawValue = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
            if (idRawValue != null)
            {
                long modelId;
                if (long.TryParse(idRawValue.AttemptedValue, NumberStyles.Integer | NumberStyles.AllowParentheses,
                                  CultureInfo.CurrentCulture, out modelId))
                {
                    var resolver = actionContext.ControllerContext.Configuration.DependencyResolver;

                    var model = _repository.Get(modelId);
                    if (model != null)
                    {
                        bindingContext.Model = model;
                        return true;
                    }
                }

                throw new EntityNotFoundException(idRawValue.AttemptedValue ?? string.Empty,
                                                        bindingContext.ModelType.Name);
            }
            throw new EntityNotFoundException(bindingContext.ModelType.Name);
        }
    }
}