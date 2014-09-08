class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
  	remove_table :tasks
  end
end