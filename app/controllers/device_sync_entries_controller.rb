class DeviceSyncEntriesController < ApplicationController
  def index
    device = Device.find(params[:device_id])
    @device_sync_entries = device.device_sync_entries.order('created_at desc').page params[:page]
  end
end