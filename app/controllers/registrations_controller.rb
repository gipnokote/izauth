class RegistrationsController < Devise::RegistrationsController
  protected
    def after_sign_up_path_for(resource)
      current_user.update_logins
      home_path
    end
end