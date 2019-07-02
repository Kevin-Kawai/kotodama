class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.references :subject, index: true
      t.string :url
      t.string :language
    end
  end
end
