class Job < ActiveRecord::Base
	belongs_to :task
	belongs_to :user
	has_many :microposts

	validates :name, :presence => true
end
