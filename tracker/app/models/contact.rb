class Contact < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, uniqueness: true
end
