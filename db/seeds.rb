# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
			 name:             		"admin",
             email:                 "admin@site.com",
             password:              "password",
             password_confirmation: "password")

Token.create!(
			  token: 	0000,
			  user_id: 1)
Tag.create!(
			  token: 	0000
			  )
Position.create!(
					name: "östra-småland",
					longitude:5,
					latitude:5)
Creator.create!(
			  name: 	"admin",
			  email: "admin@site.com")
Event.create!(
			name:     "first",
			position_id: 	1,
			creator_id:     1)