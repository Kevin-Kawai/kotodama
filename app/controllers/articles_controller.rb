class ArticlesController < ApplicationController
  def index
    @articles = Article.where(Article.arel_table[:name].matches("%#{params[:search_term]}%"))
  end

  def show
    @article = Article.find(params[:id])
    @related_articles = @article.related_articles
    @translation = @article.translation
  end

  def new
    @article = Article.new
    @root_article_id = params[:root_article_id]
  end

  def create
    if params[:root_article_id].present?
      article = Article.find(params[:root_article_id])
      related_articles = article.related_articles
      # TODO: this whole thing is blagh
      created_article = article.similar_articles.create!(article_params)
      related_articles.each do |related_article|
        ArticleRelation.create!(article_id: related_article.id, article_relation_id: created_article.id)
      end
      redirect_to article_path(created_article)
    else
      article = Article.new(article_params)
      if article.save!
        redirect_to article_path(article)
      else
        render status: 500
      end
    end
  end

  def article_params
    params.require(:article).permit(:name, :url, :language)
  end
end
