class User < ActiveRecord::Base
	
	attr_accessor :password
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :email, :presence => true, :format => {:with => email_regex }
	validates :password, :presence => true,:confirmation => true, :length=> { :within => 6..40 }

	before_save :encrypt_password

	def has_password?(submitted_password)
	# Compare encrypted_password with the encrypted version of
	# submitted_password.
	return encrypted_password == encrypt(submitted_password)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	private
	 
	def encrypt_password
		self.salt = make_salt if new_record?
		self.encrypted_password = encrypt(password)
	end

	def encrypt(str)
		return secure_hash("#{salt}--#{str}")
	end

	def secure_hash(str)
		return Digest::SHA2.hexdigest(str)
	end

	def make_salt
	secure_hash("#{Time.now.utc}--#{password}")
	end
end

