class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 }
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  def liked_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def like(user)
    favorites.create(user_id: user.id)
  end

  def unlike(user)
    favorites.find_by(user_id: user.id).destroy
  end

  def feed_microposts
		Micropost.where(user_id: self.following_ids + [self.id])
	end	

  def like?(user)
    favorite_users.include?(user)
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

 
end
