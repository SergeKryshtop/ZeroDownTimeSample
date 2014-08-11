
namespace Zdd.Domain.Models
{
    public abstract class IdEntity : IEntity
    {
        public virtual long Id { get; set; }
        public virtual long TenantId { get; set; }
    }
}
