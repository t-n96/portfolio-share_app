class Post < ApplicationRecord
  mount_uploader :post_image, PostImageUploader
  validates :title, :introduction, :post_image, presence: true
  validates :title, length: { in: 1..15 }
  validates :introduction, length: { in: 1..75 }

  belongs_to :user
end
