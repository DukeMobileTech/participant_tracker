module Api
  module V1
    class ApiApplicationController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :restrict_access
      before_filter :check_version_code
      before_filter :verify_authenticity_token
      skip_before_filter :authenticate_user_from_token!
      skip_before_filter :authenticate_user!
      
      def restrict_access
        unless current_user
          api_key = ApiKey.find_by_access_token(params[:access_token])
          head :unauthorized unless api_key
        end
      end

      def check_version_code
        if params[:version_code]
          head :upgrade_required unless params[:version_code].to_i >= Settings.minimum_android_version_code
        end
      end
      
      def verify_authenticity_token
        if params[:auth_token] && params[:user_email]
          user = User.find_by_email(params[:user_email])
          permitted = Devise.secure_compare(user.authentication_token, params[:auth_token])
          head :forbidden unless user && permitted
        end
      end
    
    end
  end
end
