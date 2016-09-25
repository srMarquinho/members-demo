class Member < ApplicationRecord

  has_and_belongs_to_many :schools

  validates :name, presence: true, uniqueness: true
  validates :email, format: { with: /(\A([a-z]*\s*)*\<*([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\>*\Z)/i }
end
