module Api
  module V1
    class PagesController < JSONAPI::ResourceController
      skip_before_action :verify_authenticity_token
    end
  end
end
