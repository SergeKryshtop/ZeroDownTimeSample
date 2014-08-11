using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate.Mapping.ByCode.Conformist;
using Zdd.Domain.Models;

namespace Zdd.Persistance.Mapping
{
    public class BaseEntityMap<T> : ClassMapping<T> where T : IdEntity
    {
        public BaseEntityMap()
        {
            Property(map => map.TenantId);
        }
    }
}
