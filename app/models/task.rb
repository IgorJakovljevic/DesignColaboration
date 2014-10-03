class Task < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	has_many :jobs, :dependent => :destroy

	validates :name, :presence => true
	validates :description, :presence => true
end
