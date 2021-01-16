class Dog < ApplicationRecord
  has_many :owners, class_name: "Employee", foreign_key: :dog_id
end
