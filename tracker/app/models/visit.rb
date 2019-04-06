class Visit < ApplicationRecord
  validates :guid, :url, :accessed_at, presence: true
  validates :guid, uniqueness: true
end
