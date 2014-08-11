using System;

namespace Zdd.Domain.Models
{
    public class ProductCategory : IdEntity
    {
        public virtual string Name { get; set; }
        public virtual int OrderIndex { get; set; }
    }
}