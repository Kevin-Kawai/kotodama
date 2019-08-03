# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Resource.destroy_all
Section.destroy_all

resource = Resource.create(url: "www.test.com", language: "EN", name: "React")

related_resources = resource.related_resources
created_resource = resource.similar_resources.create!(url: "www.test.com/jp", language: "JP", name: "React")
related_resources.each do |related_resource|
  ResourceRelation.create!(resource_id: related_resource.id, resource_relation_id: created_resource.id)
end

related_resources = resource.related_resources
created_resource = resource.similar_resources.create!(url: "www.test.com/rs", language: "RS", name: "React")
related_resources.each do |related_resource|
  ResourceRelation.create!(resource_id: related_resource.id, resource_relation_id: created_resource.id)
end

related_resources = resource.related_resources
created_resource = resource.similar_resources.create!(url: "www.test.com/ch", language: "CH", name: "React")
related_resources.each do |related_resource|
  ResourceRelation.create!(resource_id: related_resource.id, resource_relation_id: created_resource.id)
end

resource.sections.create(url: "www.test.com/section/1", title: "Intro")
resource.sections.create(url: "www.test.com/section/2", title: "Next")
resource.sections.create(url: "www.test.com/section/3", title: "Awesome")
