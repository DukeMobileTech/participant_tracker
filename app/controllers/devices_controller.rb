class DevicesController < ApplicationController
  def index
    @devices = Device.all.includes(:device_sync_entries).order('device_sync_entries.updated_at DESC')
  end
end