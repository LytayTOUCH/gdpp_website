# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  {email: 'administrator@email.com', password: '!@#$%^&*()', password_confirmation:'!@#$%^&*()', username: 'AdminUser', user_profile: {name: 'Administrator', address: '#123, St. 345, Phnom Penh', phone: '0123456789', position: 'System Manager'}}
].each do |admin|
  @admin = Admin.create_with(email: admin[:email], password: admin[:password], password_confirmation: admin[:password_confirmation], username: admin[:username] ).find_or_create_by(email: admin[:email])
  UserProfile.create_with(admin_id: @admin.id, name: admin[:user_profile][:name], address: admin[:user_profile][:address], phone: admin[:user_profile][:phone], position: admin[:user_profile][:position]).find_or_create_by(name: admin[:user_profile][:name])
end