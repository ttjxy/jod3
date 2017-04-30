class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :content, presence: true
  validates :content2, presence: true
  validates :content3, presence: true
  validates :content4, presence: true
end
