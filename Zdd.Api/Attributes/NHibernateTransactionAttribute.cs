using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using System.Web.Mvc;
using NHibernate;
using ActionFilterAttribute = System.Web.Http.Filters.ActionFilterAttribute;
using IDependencyResolver = System.Web.Http.Dependencies.IDependencyResolver;

namespace Zdd.Api.Attributes
{
    public class NHibernateTransactionAttribute : ActionFilterAttribute
    {

        public override void OnActionExecuting(HttpActionContext actionContext)
        {
            base.OnActionExecuting(actionContext);


            // The reason we cannot inject the ISession is because it is created for each request.
            // A single instance of this attribute may be used to service multiple requests at once
            // and we need to ensure that we are always using the ISession for the current request.
            var nhSession = (ISession)DependencyResolver.Current.GetService<ISession>();
            nhSession.Transaction.Begin();
        }

        public override void OnActionExecuted(HttpActionExecutedContext actionExecutedContext)
        {
            base.OnActionExecuted(actionExecutedContext);
            var nhSession = (ISession)DependencyResolver.Current.GetService<ISession>();

            if (actionExecutedContext.Exception == null && nhSession.Transaction.IsActive)
            {
                nhSession.Transaction.Commit();
            }
        }
    }
}