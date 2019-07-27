class SectionsController < ApplicationController
  def create
    section = Section.new(section_params)
    if section.save!
      render json: {
        status: "Success",
        section_title: params[:sections][:title]
      }
    end
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy!
  end

  private

  def section_params
    params.require(:sections).permit(:resource_id, :url, :title)
  end
end
