class RegistrationsController < Devise::RegistrationsController
  after_action :set_identifier, only: [:create]
  
  protected
  def after_update_path_for(resource)
    edit_user_registration_path
  end
  
  private
  def set_identifier
    resource.update(identifier: Devise.friendly_token)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end