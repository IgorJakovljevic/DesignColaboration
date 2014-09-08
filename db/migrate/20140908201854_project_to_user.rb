class ProjectToUser < ActiveRecord::Migration
  def self.up
  	  create_table :projects_users, id: false do |t|
	      t.belongs_to :user
	      t.belongs_to :project
    end
  end

  def self.down
  	remove_table :projects_users
  end
end
