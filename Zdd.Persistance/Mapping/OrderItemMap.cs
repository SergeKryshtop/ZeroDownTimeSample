using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate.Mapping;
using NHibernate.Mapping.ByCode;
using NHibernate.Mapping.ByCode.Conformist;
using NHibernate.Mapping.ByCode.Impl;
using Zdd.Domain.Models;

namespace Zdd.Persistance.Mapping
{
    public class OrderItemMap : BaseEntityMap<OrderItem>
    {
        public OrderItemMap()
        {
            Table("vw_OrderItem_1");

            Id(map => map.Id, mapper =>
            {
                mapper.Generator(Generators.HighLow, g => g.Params(new
                {
                    max_lo = HiLoCfg.EntityTableMaxLo,
                    table = HiLoCfg.HiLoTenantTable,
                    column = "OrderItem",
                }));
                mapper.Column("Id");
            });

            ManyToOne(map => map.Order, m =>
            {
                m.Column("OrderId");
            
                m.Update(false);
                m.Insert(false);
                m.Fetch(FetchKind.Join);

            });

           
            Property(map => map.OrderQty);

            ManyToOne(map => map.Product, m =>
            {
                m.Column("ProductId");

                m.Update(false);
                m.Insert(false);
                m.Fetch(FetchKind.Join);

            });

          
            
        }
    }
}
