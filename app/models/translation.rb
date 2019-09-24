class Translation < ApplicationRecord
  belongs_to :translatable, polymorphic: true
  has_rich_text :content
end
