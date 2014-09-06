class Micropost < ActiveRecord::Base
	belongs_to :user
	attr_accessor :content
	validates :content, :presence => true, :length => { :maximum => 140}
	validates :user_id, :presence => true
end
