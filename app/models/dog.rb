class Dog < ApplicationRecord
  has_many :owners, class_name: "Employee", foreign_key: :dog_id
  validates :name, :breed, presence: true
  validates :age, presence: true

  def self.by_owners
    array = Dog.all.each_with_object([]) do |dog, new_hash|
      new_hash << [dog.name, dog, dog.owners.count]
    end
    array.sort_by(&:first)
  end

end
