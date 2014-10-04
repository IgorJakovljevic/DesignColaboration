class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.integer :rate
      t.belongs_to :user
      t.belongs_to :task

      t.timestamps
    end

    add_column :microposts, :job_id, :integer
  end

  def self.down
  	drop_table :jobs
  end
end
