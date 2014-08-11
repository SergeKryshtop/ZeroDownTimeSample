using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Zdd.Api.Infrastructure
{
    public interface IAppConfiguration
    {
        string ConnectionString { get; }
    }
}