module Api
  module V1
    class RelationshipTypesController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with RelationshipType.with_deleted
      end  
         
    end  
  end
end