class ArticleRelation < ApplicationRecord
  def self.all_related_articles(id)
    article_ids = where(article_id: id).map(&:article_relation_id)
    article_relation_ids = where(article_relation_id: id).map(&:article_id)
    Article.find(article_ids + article_relation_ids)
  end
end
