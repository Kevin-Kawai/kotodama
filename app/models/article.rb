class Article < ApplicationRecord
  has_and_belongs_to_many :similar_articles,
                          class_name: "Article",
                          join_table: "article_relations",
                          association_foreign_key: :article_relation_id

  has_one :translation, as: :translatable

  def related_articles
    ArticleRelation.all_related_articles(id)
  end
end
