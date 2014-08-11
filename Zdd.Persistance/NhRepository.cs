using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate;
using NHibernate.Criterion;
using NHibernate.Linq;
using Zdd.Domain;
using Zdd.Domain.Models;

namespace Zdd.Persistance
{
    public class NhRepository<T> : IRepository<T> where T : class, IEntity
    {
        protected readonly ISession Session;

        public NhRepository(ISession session)
        {
            Session = session;
        }

        public virtual T Add(T value)
        {
            Session.Save(value);
            return value;
        }

        public void SaveOrUpdate(T value)
        {
            Session.SaveOrUpdate(value);
        }

        public bool Update(T value)
        {
            Session.Update(value);
            return true;
        }

        public virtual T Get(long id)
        {
            return Session.CreateCriteria<T>()
                .Add(Restrictions.IdEq(id))
                .UniqueResult<T>();
        }

        public virtual T Load(long id)
        {
            return Session.Load<T>(id);
        }

        public virtual IQueryable<T> GetAll()
        {
            return Session.Query<T>();
        }



        public virtual void Remove(T value)
        {
            Session.Delete(value);
        }

        public virtual void Flush()
        {
            Session.Flush();
        }

    }
}

