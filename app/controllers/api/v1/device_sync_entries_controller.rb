module Api
  module V1
    class DeviceSyncEntriesController < ApiApplicationController
      respond_to :json
      
      def create
        @device_sync_entry = DeviceSyncEntry.new(device_sync_entry_params)
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
    end  
  end
end
