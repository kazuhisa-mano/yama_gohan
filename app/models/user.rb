class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :inroduction, length: {maximum: 100

  attachment :profile_image

  attr_accessor :current_password

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
  
  # def already_favorited?(user)
  #   favorites.where(user_id: user.id).exists?
  # end
end