class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.integer :rate

      t.timestamps
    end
  end

  def self.down
  	remove_table :jobs
  end
end
