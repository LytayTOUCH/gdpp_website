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
  {name: "អាជ្ញាធរសវនកម្មជាតិ"},
  {name: "ក្រសួងការពារជាតិ"},
  {name: "ក្រសួង រ៉ែ និង ថាមពល"},
  {name: "ក្រសួងកិច្ចការនារី"},
  {name: "អាជ្ញាធរទន្លេសាប"},
  {name: "គណៈកម្មាធិការជាតិរៀបចំការបោះឆ្នោត"},
  {name: "គណៈកម្មាធិការជាតិទន្លេមេគង្គ"},
  {name: "ក្រសួងវប្បធម៌ និង វិចិត្យសិល្បៈ"},
  {name: "ក្រសួង ធម្មការ និង សាសនា"},
  {name: "ក្រសួង ការបរទេស និង សហប្រតិបត្តិការអន្តរជាតិ"},
  {name: "អគ្គលេខាធិការដ្ឋាន ព្រឹទ្ធសភា"},
  {name: "ក្រសួង ទេសចរណ៍"},
  {name: "ក្រសួង សាធារណៈការ និង ដឹកជញ្ជូន"},
  {name: "ក្រសួង ការងារ និង បណ្តុះបណ្តាលវិជ្ជាជីវៈ"},
  {name: "ក្រសួង ផែនការ"},
  {name: "អជ្ញារធរជាតិប្រឆាំងនឹងគ្រឿងញៀន"},
  {name: "ក្រសួង កសិកម្ម រុក្ខាប្រម៉ាញ់ និង នេសាទ"},
  {name: "ក្រសួង ធនធានទឹក និង ឧតុនិយម"},
  {name: "ក្រសួង ព័ត៌មាន"},
  {name: "ក្រសួង មហាផ្ទៃ (រដ្ឋបាលទូទៅ)"},
  {name: "ក្រសួង សេដ្ឋកិច្ច និង ហិរញ្ញវត្ថុ"},
  {name: "ក្រសួង យុត្តិធម៌"},
  {name: "ក្រសួង បរិស្ថាន"},
  {name: "តុលាការកំពូល"},
  {name: "ក្រសួងអភិវ្ឍន៍ជនបទ"},
  {name: "អង្គភាពប្រឆាំងអំពីពុករលួយ"},
  {name: "ឧត្តមក្រុមព្រឹក្សានៃអង្គចៅក្រម"},
  {name: "សាលាឧទ្ធរណ៍"},
  {name: "វិទ្យាស្ថានស្រាវជ្រាវ និងអភិវឌ្ឍន៍កសិកម្មកម្ពុជា"},
  {name: "មជ្ឈមណ្ឌលពិសោធន៍សុខាភិបាល"},
  {name: "វិទ្យាស្ថានស្រាវជ្រាវកៅស៊ូកម្ពុជា"},
  {name: "វិទ្យាស្ថានជាតិសុខភាពសាធារណៈ"},
  {name: "សាកលវិទ្យាល័យភូមិន្ទកសិកម្"},
  {name: "សាកលវិទ្យាល័យ វិទ្យាសាស្រ្តសុខាភិបាល"},
  {name: "សាកលវិទ្យាល័យភូមិន្ទវិចិត្រសិល្បៈ"},
  {name: "រដ្ឋាករទឹកស្វយ័តក្រុងភ្នំពេញ"},
  {name: "សាលាជាតិកសិកម្ម កំពង់ចាម"},
  {name: "រដ្ឋាករទឹកស្វយ័តសៀមរាប"},
  {name: "ភ្នាក់ងារកម្ពុជានាវាចរណ៍"},
  {name: "មន្ទីរពេទ្យកុមារជាតិ"},
  {name: "សាលាជាតិកសិកម្ម ព្រែកលៀប"},
  {name: "មន្ទីរពេទ្យមតិ្តភាពខ្មែរ - សូវៀត"},
  {name: "ធានាគារអភិវឌ្ឍជនបទ"},
  {name: "បញ្ញាតិ្តករទូរគមនាគមន៍កម្ពុជា"},
  {name: "ខេត្ត កំពង់ស្ពឺ"},
  {name: "រាជធានីភ្នំពេញ"},
  {name: "ខេត្ត ព្រៃវែង"},
  {name: "ខេត្ត កណ្តាល"},
  {name: "ខេត្ត កំពង់ចាម"},
  {name: "ខេត្ត កំពង់ឆ្នាំង"},
  {name: "ខេត្ត ស្វាយរៀង"},
  {name: "ខេត្ត កំពត"},
  {name: "ខេត្ត ព្រះសីហនុ"},
  {name: "ខេត្ត កែប"},
  {name: "ខេត្ត ពោធិសាត់"},
  {name: "ខេត្ត កោះកុង"},
  {name: "ខេត្ត ត្បូងឃ្មុំ"}
].each do |procurement_entity|
  @procurement_entity = ProcurementEntity.create_with(name: procurement_entity[:name] ).find_or_create_by(name: procurement_entity[:name])
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