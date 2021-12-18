class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @post_images = PostImage.where("shop_name LIKE?","#{word}")
    elsif search == "forward_match"
      @post_images = PostImage.where("shop_name LIKE?","#{word}")
    elsif search == "backward_match"
      @post_images = PostImage.where("shop_name LIKE?","#{word}")
    elsif search == "partial_match"
      @post_images = PostImage.where("shop_name LIKE?","#{word}")
    else
      @post_images = PostImage.all
    end
  end

end
