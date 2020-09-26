class User < ApplicationRecord
	validates :lasttname, presence: true, length: { maximum: 10 }
	validates :firstname, presence: true, length: { maximum: 10 }
	validates :username, presence: true, length: { maximum: 20 },
						 uniqueness: { case_sensitive: false }
	validates_acceptance_of :agreement, allow_nil: false, on: :create
	has_secure_password
end
