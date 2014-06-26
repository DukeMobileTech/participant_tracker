module Api
  module V1
    class RelationshipsController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with Relationship.with_deleted
      end  
      
      def create
        @relationship = Relationship.new(relationship_params)
        if @relationship.save
          render json: @relationship, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end 
       
      def update
        @relationship = Relationship.find(params[:id])
        if @relationship.update_attributes(relationship_params)
          render json: @relationship, status: :ok
        else
          render nothing: true, status: :unprocessable_entity
        end
      end
      
      private
      def relationship_params
        params.require(:relationship).permit(:participant_owner_uuid, :participant_related_uuid, :uuid, :relationship_type_id)
      end
         
    end  
  end
end