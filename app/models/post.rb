class Post < ApplicationRecord
  mount_uploader :post_image, PostImageUploader
  validates :title, :introduction, :post_image, presence: true
  validates :title, length: { in: 1..15 }
  validates :introduction, length: { in: 1..105 }
  enum status: { published: 0, draft: 1 }

  belongs_to :user
  has_many :favorites, dependent: :destroy

  def self.search(keyword)
    where(["title like? OR  introduction like?", "%#{keyword}%", "%#{keyword}%"])
  end

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
