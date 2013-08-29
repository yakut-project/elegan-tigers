require 'application_responder'

class Teachers::BaseController < ActionController::Base
  before_action :authenticate_teacher!
  self.responder = ApplicationResponder
  respond_to :html, :json
end