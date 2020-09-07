class Post < ApplicationRecord
  belongs_to :user

  has_many_attached :photos

  validates :name, :description, presence: true
end
