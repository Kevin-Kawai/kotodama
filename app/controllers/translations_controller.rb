class TranslationsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @translation = @section.translations.new
  end

  def create
    redirect_to action: :show
  end

  def show
    @translation = Translation.find(params[:id])
  end

  def edit
    # @translation = Translation.find(params[:id])
    # TODO: when implementing use above
    @section = Section.find(params[:section_id])
    @translation = Translation.new
  end

  def update
    redirect_to action: :show
  end
end
