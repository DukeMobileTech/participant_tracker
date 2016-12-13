module Api
  module V2
    class ResponsesController < ApiApplicationController
      respond_to :json

      def create
        response = Response.new(response_params)
        if response.save
          render json: response, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def response_params
        params.require(:response).permit(:uuid, :survey_uuid, :question_identifier, :question_id,
                                         :question_version, :text, :other_response, :special_response,
                                         :time_started, :time_ended, :device_user_id)
      end
    end
  end
end