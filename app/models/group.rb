class Group < ApplicationRecord
  validates :title, presence: true
  validates :description, presence:true
  validates :description2, presence:true
  belongs_to :user
  has_many :posts
end
