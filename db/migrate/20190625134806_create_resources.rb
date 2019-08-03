class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.integer :resource_relation_id
      t.string :name
      t.string :url
      t.string :language
    end
  end
end
