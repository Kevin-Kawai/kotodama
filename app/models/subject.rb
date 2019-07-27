class Subject < ApplicationRecord
  has_many :resources

  def available_languages
    resources.map(&:language)
  end
end
