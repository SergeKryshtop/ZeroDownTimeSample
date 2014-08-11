using System.Collections.Generic;

namespace Zdd.Domain.Models
{
    public class Order  : IdEntity
    {
        public virtual IList<OrderItem> Items { get; set; }

        public Order()
        {
            
        }
    }
}
