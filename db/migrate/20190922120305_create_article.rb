class CreateArticle < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :url
      t.string :language
    end
  end
end
