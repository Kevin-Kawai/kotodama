class CreateArticleRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :article_relations do |t|
      t.integer :article_id
      t.integer :article_relation_id
    end
  end
end
