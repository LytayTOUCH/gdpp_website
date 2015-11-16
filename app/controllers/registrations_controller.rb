class RegistrationsController < Devise::RegistrationsController
  def after_update_path_for(resource)
    puts administrator_index_path
  end
end