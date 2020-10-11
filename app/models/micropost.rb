class Micropost < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum:140 }
  validates :picture, presence: true
  mount_uploader :picture, PictureUploader
  validate :picture_size
  has_many :comments, dependent: :destroy

  def user
    return User.find_by(id: self.user_id)
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

 
end
