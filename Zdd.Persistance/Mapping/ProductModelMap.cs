using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate.Mapping.ByCode;
using NHibernate.Mapping.ByCode.Conformist;
using Zdd.Domain.Models;

namespace Zdd.Persistance.Mapping
{
    public class ProductModelMap: ClassMapping<ProductModel>
    {
        public ProductModelMap()
        {
            Table("vw_ProductModel_1");

            Id(map => map.Id);
            Property(map => map.Name);
         

        }
    }
}
