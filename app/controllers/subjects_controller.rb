class SubjectsController < ApplicationController
  def index
    @subjects = Subject.where(Subject.arel_table[:name].matches("%#{params[:search_term]}%"))
  end

  def show
    @subject = Subject.find_by(id: params[:id])
    @sections = @subject.resources.first.sections
    @available_languages = @subject.available_languages
  end
end
