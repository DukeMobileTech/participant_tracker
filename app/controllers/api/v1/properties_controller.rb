module Api
  module V1
    class PropertiesController < ApiApplicationController
      respond_to :json
      
      def index
        respond_with Property.all
      end  
         
    end  
  end
end