using System;

namespace Zdd.Domain.Models
{
    public class ProductModel : IdEntity
    {
        public virtual string Name { get; set; }
        public virtual string CatalogDescription { get; set; }
    }
}