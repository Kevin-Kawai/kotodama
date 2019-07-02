class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :resource, index: true
      t.string :url
      t.string :title
    end
  end
end
