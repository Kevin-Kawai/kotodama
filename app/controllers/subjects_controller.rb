class SubjectsController < ApplicationController
  def index
    @subjects = Subject.where(Subject.arel_table[:name].matches("%#{params[:search_term]}%"))
  end

  def new
    @subject = SubjectForm.new(params[:search_term])
  end

  def create
    subject = Subject.new(subject_params)
    subject.resources.build(resources_params)
    if subject.save!
      redirect_to subject_path(subject)
    else
      render status: 500
    end
  end

  def show
    @subject = Subject.find_by(id: params[:id])
    @sections = @subject.resources.first.sections
    @available_languages = @subject.available_languages
  end

  private

  def subject_params
    # we use subject form as we are passing SubjectForm to form_for
    params.require(:subject_form).permit(:name)
  end

  def resources_params
    # we use subject as the require key here as we ask for url and language on the
    # same form we use for the parameters of subject
    params.require(:subject_form).permit(:url, :language)
  end
end
