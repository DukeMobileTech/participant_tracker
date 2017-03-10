module Api
  module V1
    class SessionsController < Devise::SessionsController
      skip_before_filter :verify_authenticity_token, if: proc { |c| c.request.format == 'application/json' }
      skip_before_filter :restrict_access, only: [:destroy]
      skip_before_filter :check_version_code, only: [:destroy]
      respond_to :json

      def create
        warden.authenticate!(scope: resource_name, recall: '#{controller_path}#failure')
        if current_user.projects.exists?(params[:project_id])
          render json: { success: true, info: 'Logged in', data: { auth_token: current_user.authentication_token } }, status: :ok
        else
          failure
        end
      end

      def destroy
        current_user = User.find_by_authentication_token(params[:auth_token])
        if current_user
          current_user.update_column(:authentication_token, nil)
          render json: { success: true, info: 'Logged out', data: {} }, status: :ok
        else
          failure
        end
      end

      def failure
        render json: { success: false, info: 'Login failure', data: {} }, status: :unauthorized
      end
    end
  end
end
