class User < ActiveRecord::Base
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :firstname, :presence => true
	validates :lastname, :presence => true
	validates :email, :presence => true, :format => {:with => email_regex }, :uniqueness => true

end
