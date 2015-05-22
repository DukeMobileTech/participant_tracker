class DeviceSyncEntriesController < ApplicationController
  def index
    @device_sync_entries = DeviceSyncEntry.all.order('created_at desc').page params[:page]
  end
end
