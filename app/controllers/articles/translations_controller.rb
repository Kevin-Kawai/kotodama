class Articles::TranslationsController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @translation = @article.build_translation
  end

  def create
    article = Article.find(params[:article_id])
    article.create_translation!(translation_params)
    # FIXME: redirect path
    # redirect_to section_translation_path(section_id: section.id, id: translation.id)
    redirect_to article_path(article)
  end

  def edit
    @article = Article.find(params[:id])
    @translation = @article.translation
  end

  def update
    translation = Translation.find(params[:id])
    translation.update!(translation_params)
    article = translation.translatable
    # FIXME: redirect path
    redirect_to article_path(article)
  end

  private

  def translation_params
    params.require(:translation).permit(:content)
  end
end
