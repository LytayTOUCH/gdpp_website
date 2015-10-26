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


budget_source_list = [
  {name: "budget source A"},
  {name: "budget source B"},
  {name: "budget source C"}
].each do |budget_source|
  @budget_source = BudgetSource.create_with(name: budget_source[:name]).find_or_create_by(name: budget_source[:name])
end

procurement_entity_list = [
  {name: "Procurement entity A "},
  {name: "Procurement entity B "},
  {name: "Procurement entity C "},
  {name: "Procurement entity D "}
].each do |procurement_entity|
  @procurement_entity = ProcurementEntity.create_with(name: procurement_entity[:name] ).find_or_create_by(name: procurement_entity[:name])
end 

announcement_type_list= [
  {name: "announcement type A"},
  {name: "announcement type B"},
  {name: "announcement type C"},
  {name: "announcement type D"},
].each do |announcement_type|
  @announcement_type = AnnouncementType.create_with(name: announcement_type[:name]).find_or_create_by(name: announcement_type[:name])
end


[
  {title: "announcement 1", description: "Description announcement 1", announcement_type_id: @announcement_type.id, open_register_date: Time.now, close_submit_date: "2016-10-8", open_bid_doc_date: "2016-10-8"  , procurement_entity_id: @procurement_entity.id, budget_source_id: @budget_source.id, public: true  },
  {title: "announcement 2", description: "Description announcement 2", announcement_type_id: @announcement_type.id, open_register_date: Time.now, close_submit_date: "2016-10-8", open_bid_doc_date: "2016-10-8"  , procurement_entity_id: @procurement_entity.id, budget_source_id: @budget_source.id, public: true  },
  {title: "announcement 3", description: "Description announcement 3", announcement_type_id: @announcement_type.id, open_register_date: Time.now, close_submit_date: "2016-10-8", open_bid_doc_date: "2016-10-8"  , procurement_entity_id: @procurement_entity.id, budget_source_id: @budget_source.id, public: true }

].each do |announcement|
  Announcement.create_with(
      title: announcement[:title],
      description: announcement[:description],
      announcement_type_id: announcement[:announcement_type_id], 
      open_register_date: announcement[:open_register_date],
      close_submit_date: announcement[:close_submit_date],
      open_bid_doc_date: announcement[:open_bid_doc_date],
      procurement_entity_id: announcement[:procurement_entity_id],
      budget_source_id: announcement[:budget_source_id],
      public: announcement[:public]
  ).find_or_create_by(title: announcement[:title])
end