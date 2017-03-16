class AndroidUpdatesController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :authenticate_user_from_token!
  skip_before_filter :set_project

  def index
    @update = AndroidUpdate.latest_version
  end

  def show
    @update = AndroidUpdate.find(params[:id])
    send_file @update.apk_update.path, filename: @update.apk_update_file_name, disposition: 'attachment', type: @update.apk_update_content_type
  end
end
