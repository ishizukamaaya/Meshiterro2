class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォローしてる人の取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォローされている人の取得
  has_many :following_user, through: :follower, source: :followed #自分がフォローしてる人
  has_many :follower_user, through: :followed, source: :follower　#自分をフォローしてる人

  attachment :profile_image

  validates :name, presence: true

  #フォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  #フォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  #フォロー確認
  def following(user)
    following_user.include?(user)
  end


end
