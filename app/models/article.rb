class Article < ApplicationRecord
  has_one :translation, as: :translatable
end
