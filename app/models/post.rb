class Post < ApplicationRecord
  mount_uploader :post_image, PostImageUploader
  validates :title, :introduction, :post_image, presence: true
  validates :title, length: { in: 1..15 }
  validates :introduction, length: { in: 1..105 }

  belongs_to :user

  def self.search(keyword)
    where(["title like? OR  introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
