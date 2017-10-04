class ApplicationController < ActionController::Base
  include ProjectsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!
  before_filter :set_project
  before_action :set_paper_trail_whodunnit

  protected

  def user_for_paper_trail
    if admin_user_signed_in?
      "#{current_admin_user.class}:#{current_admin_user.try(:id)}"
    elsif user_signed_in?
      "#{current_user.class}:#{current_user.try(:id)}"
    end
  end

  private

  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user = user_email && User.find_by_email(user_email)

    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user, store: false
    end
  end

  def set_project
    if params[:project_id] && current_project && current_project.id != params[:project_id]
      project = Project.find(params[:project_id])
      set_current_project(project)
    end
  end
end
