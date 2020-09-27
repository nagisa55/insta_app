class User < ApplicationRecord
	before_save { self.email.downcase! }
	validates :lastname, presence: true, length: { maximum: 10 }
	validates :firstname, presence: true, length: { maximum: 10 }
	validates :username, presence: true, length: { maximum: 20 },
						uniqueness: { case_sensitive: false }

	validates :email, presence: true, length: { maximum: 255 },
										format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
										uniqueness: { case_sensitive: false }
	
	has_secure_password
end
