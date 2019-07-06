class SubjectForm
  include ActiveModel::Model
  attr_reader :name, :url, :language

  def initialize(search_term = '')
    @name = search_term
    @url = ''
    @language = ''
  end
end