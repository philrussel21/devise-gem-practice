class RegistrationsController < Devise::RegistrationsController
  protected

  #below is for redirection after sign-up.
  def after_sign_up_path_for(resource)
    #path to create new profile
    new_profile_path
  end
end