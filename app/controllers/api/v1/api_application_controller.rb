module Api
  module V1
    class ApiApplicationController < ApplicationController
      protect_from_forgery with: :null_session
      skip_before_filter :authenticate_user!
    end
  end
end
