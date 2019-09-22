class Translation < ApplicationRecord
  belongs_to :translatable, polymorphic: true
  belongs_to :section
  has_rich_text :content
end
