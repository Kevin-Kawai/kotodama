class ArticlesController < ApplicationController
  def index
    @articles = Article.where(Article.arel_table[:name].matches("%#{params[:search_term]}%"))
  end

  def show
    @article = Article.find(params[:id])
                      .eager_load(:translation)
  end

  def new
    @article = Article.new
  end

  def create
    article = Article.new(article_params)
    if article.save!
      redirect_to article_path(article)
    else
      render 500
    end
  end

  def article_params
    params.require(:article).permit(:name, :url, :language)
  end
end
