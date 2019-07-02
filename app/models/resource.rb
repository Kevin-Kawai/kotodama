class Resource < ApplicationRecord
  belongs_to :subject
  has_many :sections
end