using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NHibernate;
using NHibernate.Mapping;
using NHibernate.Mapping.ByCode;
using NHibernate.Mapping.ByCode.Conformist;
using NHibernate.Mapping.ByCode.Impl;
using NHibernate.Type;
using Zdd.Domain.Models;

namespace Zdd.Persistance.Mapping
{
    public class ProductMap : BaseEntityMap<Product>
    {
        public ProductMap()
        {
            Table("vw_Product_1");

            Id(map => map.Id, mapper =>
            {
                mapper.Generator(Generators.HighLow, g => g.Params(new
                {
                    max_lo = HiLoCfg.EntityTableMaxLo,
                    table = HiLoCfg.HiLoTenantTable,
                    column = "Product",
                }));
                mapper.Column("Id");
            });

            ManyToOne(map => map.Category, mapper =>
            {
                mapper.Fetch(FetchKind.Join);
                mapper.OptimisticLock(true);
                mapper.Insert(false);
                mapper.Update(false);
                mapper.Column("CategoryId");
            });

            ManyToOne(map => map.SubCategory, mapper =>
            {
                mapper.Fetch(FetchKind.Join);
                mapper.OptimisticLock(true);
                mapper.Insert(false);
                mapper.Update(false);
                mapper.Column("ProductSubCategoryId");
               
            });
            ManyToOne(map => map.Model, mapper =>
            {
                mapper.Fetch(FetchKind.Join);
                 mapper.OptimisticLock(true);
                mapper.Insert(false);
                mapper.Update(false);
                mapper.Column("ProductModelId");

            });
            Property(map => map.Name);
            
            Property(map => map.ProductNumber);
            Property(map => map.Description);
            Property(map => map.MakeFlag);
            Property(map => map.FinishedGoodsFlag);
            Property(map => map.Color);
            Property(map => map.SafetyStockLevel);
            Property(map => map.ReorderPoint);
            Property(map => map.StandardCost);
            Property(map => map.ListPrice);
            Property(map => map.Size);

            Property(map => map.Weight);
            Property(map => map.DaysToManufacture);
            Property(map => map.ProductLine, mapper =>
            {
                mapper.Length(2);
            });
            Property(map => map.Class, mapper =>
            {
                mapper.Length(2);
            });
            Property(map => map.Style, mapper =>
            {
                mapper.Length(3);
            });
            Property(map => map.SellStartDate);
            Property(map => map.SellEndDate);
            Property(map => map.DiscontinuedDate);
            Property(map => map.ModifiedDate);


            Property(map => map.SizeUnitMeasureCode, mapper =>
            {
                mapper.Length(3);
            });


            Property(map => map.WeightUnitMeasureCode, mapper =>
            {
                mapper.Length(3);
            });
          




        }
    }
}
