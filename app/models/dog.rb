class Dog < ApplicationRecord
  has_many :owners, class_name: "Employee", foreign_key: :dog_id
  validates :name, :breed, presence: true
  validates :age, presence: true
end
