class SectionsController < ApplicationController
  def index
    @sections = Section.where(Section.arel_table[:title].matches("%#{params[:search_term]}%")).eager_load(:resources)
  end

  def new
    @section = SubjectForm.new(params[:search_term])
  end
  def create
    section = Section.new(section_params)
    if section.save!
      render json: {
        status: "Success",
        section_title: section.title,
        section_id: section.id,
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
