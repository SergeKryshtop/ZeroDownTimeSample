using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using Zdd.Api.Models;
using Zdd.Domain.Models;

namespace Zdd.Api.App_Start
{
    public class AutoMapperConfig
    {
        public static void Configure()
        {
            Mapper.CreateMap<Product, ProductViewModel>();
            Mapper.CreateMap<ProductViewModel, Product>();

        }
    }
}