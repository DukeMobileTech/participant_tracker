module Api
  module V1
    class PropertiesController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with Property.with_deleted
      end  
         
    end  
  end
end