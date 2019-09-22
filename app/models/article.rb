class Article < ApplicationRecord
  has_one :translations, as: :translatable
end
