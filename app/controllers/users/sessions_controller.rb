# frozen_string_literal: true

class [users]::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def create
    FactoryBot.define do
      factory :user do
        email { Faker::Internet.email }
        password { "password"} 
        password_confirmation { "password" }
        confirmed_at { Date.today }
      end
    end
  end
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
