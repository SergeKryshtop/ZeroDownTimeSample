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
    public class ProductSubCategoryMap: BaseEntityMap<ProductSubCategory>
    {
        public ProductSubCategoryMap()
        {
            Table("vw_ProductSubCategory_1");

            Id(map => map.Id);
            Property(map => map.Name);
            ManyToOne(map => map.Category, mapper => mapper.Column("ProductCategoryId"));
        }
    }
}
