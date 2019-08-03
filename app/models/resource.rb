class Resource < ApplicationRecord
  has_and_belongs_to_many :similar_resources,
                          class_name: "Resource",
                          join_table: "resource_relations",
                          association_foreign_key: :resource_relation_id

  has_many :sections

  def related_resources
    ResourceRelation.all_related_resources(id)
  end
end