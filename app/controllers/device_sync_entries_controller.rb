class DeviceSyncEntriesController < ApplicationController
  def index
    @device_sync_entries = DeviceSyncEntry.all
  end
end
