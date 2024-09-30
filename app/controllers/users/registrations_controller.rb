class Users::RegistrationsController < Devise::RegistrationsController
  protected

  # Override Devise method to allow updating without current password
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
