class ApiV1::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user_from_token!
  respond_to :json
end