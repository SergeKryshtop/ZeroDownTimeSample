using System.Linq;
using Zdd.Domain.Models;

namespace Zdd.Domain
{
    public interface IRepository<TEntity> where TEntity : class, IEntity
    {
        TEntity Get(long id);
        TEntity Load(long id);
        IQueryable<TEntity> GetAll();
        TEntity Add(TEntity value);
        bool Update(TEntity value);
        void SaveOrUpdate(TEntity value);
        void Remove(TEntity value);
        void Flush();
    }
}
