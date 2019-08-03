class ResourceRelation < ApplicationRecord
  def self.all_related_resources(id)
    resource_ids = where(resource_id: id).map(&:resource_relation_id)
    resource_relation_ids = where(resource_relation_id: id).map(&:resource_id)
    Resource.find(resource_ids + resource_relation_ids)
  end
end
