class SubjectsController < ApplicationController
  def index
    @subjects = Subject.where(Subject.arel_table[:name].matches("%#{params[:search_term]}%"))
  end

  def new
    @search_term = params[:search_term]
    @subject = Subject.new(name: params[:search_term])
  end

  def create
    subject = Subject.new(subject_params)
    if subject.save!
      redirect_to subject_path(subject)
    else
      render status: 500
    end
  end

  def show
    @subject = Subject.find_by(id: params[:id])
    @sections = @subject&.resources.first&.sections
    @available_languages = @subject.available_languages
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end
end
