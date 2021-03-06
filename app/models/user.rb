class User < ActiveRecord::Base

	before_save { self.email.downcase! }

	validates(:name, presence: true, length: { in: 2..128 })
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	 validates 	:email,
				presence: true,
				format: { with: VALID_EMAIL_REGEX },
				uniqueness: {case_sensitive: false} 

	has_secure_password

	validates(:password_digest, presence: true)

	validates(:password, length: { minimum: 8} )

end
