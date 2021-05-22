# frozen_string_literal: true

class Users::RegisrationsController < Devise::RegisrationsController
  protected

  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      resource.update(params)
    else
      resource.update_without_password(params)
    end
  end
end
