Rails.application.routes.draw do
  root 'website#index'
  # get 'contact' => 'website#contact'

  get 'show_public_services' => 'website#show_public_services'
  get 'faq_in_website'=> 'website#show_question_answer'
  get 'show_contact' => 'website#show_contact', as: 'show_contact'

  get 'procurement_entity_city_province' => 'website#show_procurement_entity_city_province'
  get 'procurement_entity_ministry' => 'website#show_procurement_entity_ministry'
  get 'procurement_entity_public_foundation' => 'website#show_procurement_entity_public_foundation'

  get 'bidder_list_registrative_form' => 'website#show_bidder_list_registrative_form'
  get 'bidding_document' => 'website#show_bidding_document'
  get 'planning_approval_correction' => 'website#show_planning_approval_correction'

  get 'gdpp_role' => 'website#show_gdpp_role'
  get 'gdpp_structure' => 'website#show_gdpp_structure'

  get 'show_announcements/:type_id' => 'website#show_announcements', as: 'show_announcements'

  get 'show_announcement/:id' => 'website#show_announcement', as: 'show_announcement'

  get 'show_procurement_entities/:category_id' => 'website#show_procurement_entities', as: 'show_procurement_entities'

  get 'show_procurement_plans/:type' => 'website#show_procurement_plans', as: 'show_procurement_plans'

  get 'show_law_regulations/:law_category_id' => 'website#show_law_regulations', as: 'show_law_regulations'

  get 'show_law_regulation/:id' => 'website#show_law_regulation', as: 'show_law_regulation'

  get 'show_awarding_contracts/:procurement_method_id' => 'website#show_awarding_contracts', as: 'show_awarding_contracts'

  get 'show_awarding_contract/:id' => 'website#show_awarding_contract', as: 'show_awarding_contract'

  resources :administrator do
    collection do
      resources :budget_sources
      resources :announcements
      resources :procurement_entities
      resources :announcement_types
      resources :law_regulations
      resources :public_services
      resources :faqs
      resources :org_structures
      resources :procurement_plans
      resources :procurement_methods
      resources :awarding_contracts
      resources :admins
      resources :current_profiles do
        collection do
          get 'edit' => 'current_profiles#edit'
        end
      end
      resources :law_categories
      resources :contacts
      resources :image_slides
      resources :purchase_orders
    end
  end

  # # budget source
  # get 'budget_sources' => 'administrator#budget_sources'
  # post 'create_budget_source' => 'administrator#create_budget_source'
  
  # get 'new_budget_source/new' => 'administrator#new_budget_source', as: "new_budget_source"
  
  # get 'budget_source/:id' => 'administrator#show_budget_source', as: "budget_source"
  # get 'edit_budget_source/:id/edit' => 'administrator#edit_budget_source', as: "edit_budget_source"
  # get 'destroy_budget_source/:id' => 'administrator#edit_budget_source', as: "destroy_budget_source"
  # patch 'update_budget_source/:id' => 'administrator#update_budget_source' as: 


  devise_for :admin, skip: [:sessions, :passwords, :confirmations, :registrations], :controller => {:registrations => :registrations}
  as :admin do
    # get 'administrator/login' => 'devise/sessions#new', as: :administrator_login
    # delete 'administrator/logout' => 'devise/sessions#destroy', as: :administrator_logout
    # session handling
    scope '/admin' do
      get     '/login'  => 'devise/sessions#new',     as: 'new_admin_session'
      post    '/login'  => 'devise/sessions#create',  as: 'admin_session'
      delete  '/logout' => 'devise/sessions#destroy', as: 'destroy_admin_session'
      # joining
      # get   '/register' => 'devise/registrations#new',    as: 'new_admin_registration'
      # post  '/register' => 'devise/registrations#create', as: 'admin_registration'
    end
    # scope '/account' do
    #   # password reset
    #   get   '/reset-password'        => 'devise/passwords#new',    as: 'new_admin_password'
    #   put   '/reset-password'        => 'devise/passwords#update', as: 'admin_password'
    #   post  '/reset-password'        => 'devise/passwords#create'
    #   get   '/reset-password/change' => 'devise/passwords#edit',   as: 'edit_admin_password'
    #   # confirmation
    #   get   '/confirm'        => 'devise/confirmations#show',   as: 'admin_confirmation'
    #   post  '/confirm'        => 'devise/confirmations#create'
    #   get   '/confirm/resend' => 'devise/confirmations#new',    as: 'new_admin_confirmation'
    #   # settings & cancellation
    #   get '/cancel'   => 'devise/registrations#cancel', as: 'cancel_admin_registration'
    #   get '/settings' => 'devise/registrations#edit',   as: 'edit_admin_registration'
    #   put '/settings' => 'devise/registrations#update'
    #   # account deletion
    #   delete '' => 'devise/registrations#destroy'
    # end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
