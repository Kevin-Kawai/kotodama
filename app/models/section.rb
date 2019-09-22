class Section < ApplicationRecord
  belongs_to :resource
  has_many :translations, as: :translatable
end