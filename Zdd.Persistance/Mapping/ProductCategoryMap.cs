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
    public class ProductCategoryMap : BaseEntityMap<ProductCategory>
    {
        public ProductCategoryMap()
        {
            Table("vw_ProductCategory_1");

            Id(map => map.Id);
            Property(map => map.Name);
         

        }
    }
}
