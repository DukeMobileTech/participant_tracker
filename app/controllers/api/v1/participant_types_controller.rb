module Api
  module V1
    class ParticipantTypesController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with ParticipantType.with_deleted
      end  
         
    end  
  end
end