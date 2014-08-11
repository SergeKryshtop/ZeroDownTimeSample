using System;

namespace Zdd.Domain
{
    public class EntityNotFoundException : Exception
    {
        public string Entity { get; set; }
        public string Id { get; set; }

        public EntityNotFoundException(string entity, string id)
        {
            Entity = entity;
            Id = id;
        }

        public EntityNotFoundException(string entity)
        {
            Entity = entity;
            Id = string.Empty;
        }

        public override string Message
        {
            get { return string.Format("Entity {0} with id {1} was not found", Entity, Id); }
        }
    }
}