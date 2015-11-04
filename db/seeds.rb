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
  {name: "ថវិការាជរដ្ឋាភិបាល"},
  {name: "ថវិការបស់អគ្គិសនីកម្ពុជា"},
  {name: "ថវិការបស់រដ្ឋាករទឹកស្វយ័តក្រុងភ្នំពេញ"},
  {name: "ថវិការបស់បញ្ញត្តិករទូរគមនាគមន៍កម្ពុជា"},
  {name: "ថវិការបស់បេឡាជាតិរបបសន្តិសុខសង្គម"},
  {name: "ថវិការបស់គ្រឹះស្ថានបោះពុម្ព និងចែកផ្សាយ"},
  {name: "ថវិការបស់បេឡាជាតិរបបសន្តិសុខសង្គម"},
  {name: "ថវិការបស់សាកលវិទ្យាល័យ"},
  {name: "ថវិការបស់រដ្ឋាករទឹកស្វយ័តសៀមរាប"},
  {name: "ថវិការបស់មជ្ឍមណ្ឌលជាតិពិសោធន៍សុខាភិបាល"}
].each do |budget_source|
  @budget_source = BudgetSource.create_with(name: budget_source[:name]).find_or_create_by(name: budget_source[:name])
end

procurement_category_list =[
  {name: "ក្រសួង – ស្ថាប័នថ្នាក់កណ្តាល"},
  {name: "គ្រឹះស្ថានសាធារណៈ – សហគ្រាសសាធារណៈ"},
  {name: "រាជធានី​ – ខេត្ត"}
].each do |pc|
  @procurement_category = ProcurementCategory.create_with(name: pc[:name]).find_or_create_by(name: pc[:name])
end

procurement_entity_list = [
  {name: "អាជ្ញាធរសវនកម្មជាតិ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួងការពារជាតិ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង រ៉ែ និង ថាមពល", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួងកិច្ចការនារី", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "អាជ្ញាធរទន្លេសាប", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "គណៈកម្មាធិការជាតិរៀបចំការបោះឆ្នោត", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "គណៈកម្មាធិការជាតិទន្លេមេគង្គ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួងវប្បធម៌ និង វិចិត្យសិល្បៈ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ធម្មការ និង សាសនា", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ការបរទេស និង សហប្រតិបត្តិការអន្តរជាតិ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "អគ្គលេខាធិការដ្ឋាន ព្រឹទ្ធសភា", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ទេសចរណ៍", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង សាធារណៈការ និង ដឹកជញ្ជូន", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ការងារ និង បណ្តុះបណ្តាលវិជ្ជាជីវៈ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ផែនការ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "អជ្ញារធរជាតិប្រឆាំងនឹងគ្រឿងញៀន", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង កសិកម្ម រុក្ខាប្រម៉ាញ់ និង នេសាទ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ធនធានទឹក និង ឧតុនិយម", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង ព័ត៌មាន", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង មហាផ្ទៃ (រដ្ឋបាលទូទៅ)", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង សេដ្ឋកិច្ច និង ហិរញ្ញវត្ថុ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង យុត្តិធម៌", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួង បរិស្ថាន", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "តុលាការកំពូល", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ក្រសួងអភិវ្ឍន៍ជនបទ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "អង្គភាពប្រឆាំងអំពីពុករលួយ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ឧត្តមក្រុមព្រឹក្សានៃអង្គចៅក្រម", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "សាលាឧទ្ធរណ៍", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "វិទ្យាស្ថានស្រាវជ្រាវ និងអភិវឌ្ឍន៍កសិកម្មកម្ពុជា", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "មជ្ឈមណ្ឌលពិសោធន៍សុខាភិបាល", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "វិទ្យាស្ថានស្រាវជ្រាវកៅស៊ូកម្ពុជា", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "វិទ្យាស្ថានជាតិសុខភាពសាធារណៈ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "សាកលវិទ្យាល័យភូមិន្ទកសិកម្", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "សាកលវិទ្យាល័យ វិទ្យាសាស្រ្តសុខាភិបាល", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "សាកលវិទ្យាល័យភូមិន្ទវិចិត្រសិល្បៈ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "រដ្ឋាករទឹកស្វយ័តក្រុងភ្នំពេញ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "សាលាជាតិកសិកម្ម កំពង់ចាម", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "រដ្ឋាករទឹកស្វយ័តសៀមរាប", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ភ្នាក់ងារកម្ពុជានាវាចរណ៍", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "មន្ទីរពេទ្យកុមារជាតិ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "សាលាជាតិកសិកម្ម ព្រែកលៀប", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "មន្ទីរពេទ្យមតិ្តភាពខ្មែរ - សូវៀត", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ធានាគារអភិវឌ្ឍជនបទ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "បញ្ញាតិ្តករទូរគមនាគមន៍កម្ពុជា", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កំពង់ស្ពឺ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "រាជធានីភ្នំពេញ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត ព្រៃវែង", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កណ្តាល", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កំពង់ចាម", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កំពង់ឆ្នាំង", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត ស្វាយរៀង", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កំពត", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត ព្រះសីហនុ", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កែប", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត ពោធិសាត់", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត កោះកុង", phone: "phone-001", address: "address001", website: "website-001"},
  {name: "ខេត្ត ត្បូងឃ្មុំ", phone: "phone-001", address: "address001", website: "website-001"}
].each do |procurement_entity|
  @procurement_entity = ProcurementEntity.create_with(name: procurement_entity[:name], procurement_category_id: @procurement_category.id, phone: procurement_entity[:phone], address: procurement_entity[:address], website: procurement_entity[:website] ).find_or_create_by(name: procurement_entity[:name])
end 

announcement_type_list= [
  {name: "លទ្ធិកម្មទំនិញ"},
  {name: "លទ្ធិកម្មសំណង់"},
  {name: "លទ្ធិកម្មសេវាកម្ម"},
  {name: "លទ្ធិកម្មសេវាទីប្រឹក្សា"},
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

# public service
[
  {name: "Mr. Jack son miky", position: "Position A", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. Mily dana", position: "Position B", phone: "0987554", email: "mra@email.com"},
  {name: "Dr. Solatana", position: "Position C", phone: "0987554", email: "mra@email.com"},
  {name: "Mr. John cina", position: "Position D", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. milina", position: "Position E", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. joooli", position: "Position E", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. somatra", position: "Position E", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. somtanta", position: "Position E", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. jackolo", position: "Position E", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. dinata", position: "Position E", phone: "0987554", email: "mra@email.com"},
  {name: "Miss. sophaktra", position: "Position E", phone: "0987554", email: "mra@email.com"}
].each do |ps|
  PublicService.create_with(name: ps[:name], position: ps[:position], phone: ps[:phone], email: ps[:email] ).find_or_create_by(name: ps[:name]);
end 