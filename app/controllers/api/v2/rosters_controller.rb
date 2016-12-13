module Api
  module V2
    class RostersController < ApiApplicationController
      respond_to :json

      def create
        roster = Roster.find_by_uuid params[:roster][:uuid]
        unless roster
          roster = Roster.new(roster_params)
        end
        if roster.save
          render json: roster, status: :created
        else
          render nothing: true, status: :unprocessable_entity
        end
      end

      private
      def roster_params
        params.require(:roster).permit(:uuid, :identifier, :instrument_title, :instrument_id,
                                       :instrument_version_number)
      end

    end
  end
end