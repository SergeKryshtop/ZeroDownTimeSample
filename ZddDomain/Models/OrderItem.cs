using System;
using System.Collections.Generic;

namespace Zdd.Domain.Models
{
    public class OrderItem: IdEntity
    {
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }

        public virtual decimal OrderQty { get; set; }


        public virtual bool Equals(OrderItem other)
        {
            if (other == null || other.Order == null) return false;
           return this.Product.Id == other.Product.Id && this.Order.Id == other.Order.Id;
        }

        public override bool Equals(object obj)
        {
            return Equals(obj as OrderItem);
        }

        public override int GetHashCode()
        {
            return Order.GetHashCode() ^ Product.Id.GetHashCode();
        }

    }
}
