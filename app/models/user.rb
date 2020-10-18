 class User < ApplicationRecord
	before_save { self.email.downcase! }
	validates :lastname, presence: true, length: { maximum: 10 }
	validates :firstname, presence: true, length: { maximum: 10 }
	validates :username, presence: true, length: { maximum: 20 },
						uniqueness: { case_sensitive: false }
	validates :email, presence: true, length: { maximum: 255 },
						format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
						uniqueness: { case_sensitive: false }
	validates :introduction, length: { maximum: 100 }
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	has_many :microposts, dependent: :destroy
	has_many :comments, dependent: :delete_all
	has_many :relationships, dependent: :delete_all
	has_many :followings, through: :relationships, source: :follow
	has_many :reverse_of_relationship, class_name: "Relationship", foreign_key: "follow_id"
	has_many :followers, through: :reverse_of_relationship, source: :user
	has_many :favorites, dependent: :destroy
	
	def follow(other_user)
		unless self == other_user
			self.relationships.find_or_create_by(follow_id: other_user.id)
		end
	end

	def unfollow(other_user)
		relationship = self.relationships.find_by(follow_id: other_user.id)
		relationship.destroy if relationship
	end

	def following?(other_user)
		self.followings.include?(other_user)
	end
	
end

