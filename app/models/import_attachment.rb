class ImportAttachment < ApplicationRecord
  belongs_to :user
  has_one_attached :audio
end
