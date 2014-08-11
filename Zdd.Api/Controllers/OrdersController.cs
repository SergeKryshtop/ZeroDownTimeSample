using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Web.Http.ModelBinding;
using Seterlund.CodeGuard;
using Zdd.Api.Attributes;
using Zdd.Domain;
using Zdd.Domain.Models;

namespace Zdd.Api.Controllers
{
    [RoutePrefix("api/orders")]
    [NHibernateTransaction]
    public class OrdersController : ApiController
    {
        private readonly IRepository<Order> _repository;

        public OrdersController(IRepository<Order> repository)
        {
            Guard.That(() => repository).IsNotNull();

            _repository = repository;
        }


        // GET api/orders
        public IHttpActionResult Get()
        {
            return Ok(_repository.GetAll().Take(20).ToList());
        }

        // GET api/orders/5
        public IHttpActionResult Get(long id)
        {
            var result = _repository.Get(id);

            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }

        // POST api/orders
        public IHttpActionResult Post([FromBody]Order value)
        {
            var result = _repository.Add(value);

            return Ok(result);
        }

        // PUT api/orders/5
        public void Put([ModelBinder(Name = "id")] Order value)
        {
            _repository.Update(value);
        }

        // DELETE api/orders/5
        public void Delete(long id)
        {
            var value = _repository.Get(id);
            if (value != null)
            {
                _repository.Remove(value);
            }
        }
    }
}
