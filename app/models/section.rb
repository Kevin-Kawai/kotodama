class Section < ApplicationRecord
  belongs_to :resource
  has_rich_text :content
end