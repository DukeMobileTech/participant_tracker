module Api
  module V1
    class ParticipantTypesController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with ParticipantType.all
      end  
         
    end  
  end
end