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
    public class OrderMap : BaseEntityMap<Order>
    {
        public OrderMap()
        {
            Table("vw_Order_1");

            Id(map => map.Id, mapper =>
            {
                mapper.Generator(Generators.HighLow, g => g.Params(new
                {
                    max_lo = HiLoCfg.EntityTableMaxLo,
                    table = HiLoCfg.HiLoTenantTable,
                    column = "Order",
                }));
                mapper.Column("Id");
            });

            Bag(map => map.Items, m =>
            {
                m.Inverse(true);
                m.Cascade(Cascade.All);
                m.Key(k => k.Column("OrderId"));
                m.Lazy(CollectionLazy.NoLazy);
                m.Fetch(CollectionFetchMode.Subselect);

            }, action => action.OneToMany());
        }
    }
}
