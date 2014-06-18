module Api
  module V1
    class ParticipantsController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with Participant.all
      end  
      
      def create
        @participant = Participant.new(participant_params)
        if @participant.save
          render json: @participant, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end 
      end
      
      def update
        @participant = Participant.find(params[:id])
        if @participant.update_attributes(participant_params)
          render json: @participant, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end 
      end
      
      private
      def participant_params
        params.require(:participant).permit(:participant_type_id, :uuid)
      end
       
    end  
  end
end