class RegistrationsController < Devise::RegistrationsController
  after_action :set_identifier, only: [:create]
  

  
  private
  def set_identifier
    resource.update(identifier: Devise.friendly_token)
  end

end