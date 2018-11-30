module Api
  module V1
    # Global controller
    class ApiController < ApplicationController
      include Knock::Authenticable
      include CanCan::ControllerAdditions
    end
  end
end
