class Post < ApplicationRecord
  belongs_to :user
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  validates :name, presence: true
  validates :image, presence: true
  validates :material, presence: true
  validates :recipe, presence: true
  validates :cooking_time, presence: true

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil? #既存のタグを取得
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end
end