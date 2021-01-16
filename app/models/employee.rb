class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, :last_name, presence: true
  validates :title, presence: true, uniqueness: true
  validates :dog_id, presence: true
  validates :office, presence: true
  validate :https_url, if: :img_url
  validates :alias, presence: true, uniqueness: true

  def https_url
    unless !!self.img_url.match(/\bhttps:\/\/.*/) 
      self.errors.add(:img_url, "Image url must start with https://")
    end
  end

  def full_name
    self.first_name + " " + self.last_name
  end


end
