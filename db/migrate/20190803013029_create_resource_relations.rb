class CreateResourceRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :resource_relations do |t|
      t.integer :resource_id
      t.integer :resource_relation_id
    end
  end
end
