class TranslationsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @translation = @section.translations.new
  end

  def create
    section = Section.find(params[:section_id])
    translation = section.translations.create!(translation_params)
    redirect_to section_translation_path(section_id: section.id, id: translation.id)
  end

  def show
    @translation = Translation.find(params[:id])
  end

  def edit
    @translation = Translation.find(params[:id])
    @section = @translation.section
  end

  def update
    translation = Translation.find(params[:id])
    translation.update!(translation_params)
    redirect_to section_translation_path(section_id: translation.section.id, id: translation.id)
  end

  private

  def translation_params
    params.require(:translation).permit(:content)
  end
end
