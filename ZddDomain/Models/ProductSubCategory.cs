using System;

namespace Zdd.Domain.Models
{
    public class ProductSubCategory : IdEntity
    {
        public virtual string Name { get; set; }
        public virtual ProductCategory Category { get; set; }
        public virtual DateTime ModifiedDateTime { get; set; }
    }
}