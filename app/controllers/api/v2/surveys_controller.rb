module Api
  module V2
    class SurveysController < ApiApplicationController
      respond_to :json

      def create
        survey = Survey.new(survey_params)
        if survey.save
          render json: survey, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def survey_params
        params.require(:survey).permit(:uuid, :device_uuid, :instrument_title, :instrument_id,
                                       :instrument_version_number, :device_label, :latitude, :longitude,
                                       :metadata, :has_critical_responses, :roster_uuid)
      end
    end
  end
end