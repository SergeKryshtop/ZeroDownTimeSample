using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using AutoMapper;
using Seterlund.CodeGuard;
using Zdd.Api.Attributes;
using Zdd.Api.Models;
using Zdd.Domain;
using Zdd.Domain.Models;

namespace Zdd.Api.Controllers
{
    [RoutePrefix("api/products")]
    [NHibernateTransaction]
    public class ProductsController : ApiController
    {
        private readonly IRepository<Product> _repository;

        public ProductsController(IRepository<Product> repository)
        {
            Guard.That(() => repository).IsNotNull();

            _repository = repository;
        }


        // GET api/orders
        public IHttpActionResult Get()
        {
            int skip;
            Int32.TryParse(HttpContext.Current.Request.QueryString["skip"], out skip);

            return Ok(_repository.GetAll().Skip(skip).Take(10).Select(x => Mapper.Map<ProductViewModel>(x)).ToList());
        }

        //// GET api/orders/5?q=

        //public IHttpActionResult Get([FromUri]long id, int? skip)
        //{
        //    if (skip.HasValue)
        //    {
        //        return Ok(_repository.GetAll().Skip(skip.Value).First());
        //    }
        //    var result = _repository.Get(id);

        //    if (result == null)
        //    {
        //        return NotFound();
        //    }
        //    return Ok(result);
        //}

        // POST api/orders
        [AcceptVerbs("POST")]
        public IHttpActionResult Post([FromBody]Product value)
        {
            var result = _repository.Add(value);

            return Ok(result);
        }

    }
}
