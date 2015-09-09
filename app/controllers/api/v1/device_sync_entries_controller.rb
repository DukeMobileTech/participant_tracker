module Api
  module V1
    class DeviceSyncEntriesController < ApiApplicationController
      respond_to :json

      def create
        @device_sync_entry = DeviceSyncEntry.new(device_sync_entry_params)
        create_device
        if @device_sync_entry.save
          render json: @device_sync_entry, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def device_sync_entry_params
        params.require(:device_sync_entry).permit(:current_version, :current_language, :device_uuid, :device_label, :timezone, :participant_types, :participant_count)
      end

      def create_device
        device = Device.find_by_uuid(params[:device_sync_entry][:device_uuid])
        if device
          device.update(label: params[:device_sync_entry][:device_label]) if device.label != params[:device_sync_entry][:device_label]
        else
          device = Device.new
          device.uuid = params[:device_sync_entry][:device_uuid]
          device.label = params[:device_sync_entry][:device_label]
          device.save
        end
      end
    end
  end
end