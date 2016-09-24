class School < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
