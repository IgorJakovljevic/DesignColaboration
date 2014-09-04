require 'faker'

namespace :db do

	desc "Fill database with sample data"

		task :populate => :environment do

		Rake::Task['db:reset'].invoke

		admin = User.create!(:firstname => "Example",
		:lastname => "User",	
		:email => "example@railstutorial.org",
		:password => "foobar",
		:password_confirmation => "foobar")
		
		admin.toggle!(:admin)

		99.times do |n|
		fname = Faker::Name.first_name
		lname = Faker::Name.last_name
		email = "example-#{n+1}@railstutorial.org"
		password = "password"
		User.create!(:firstname => fname,:lastname => lname ,:email => email,:password => password,
					 :password_confirmation => password)
		end

	end

end