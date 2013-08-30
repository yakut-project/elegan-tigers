require 'application_responder'

class Hq::BaseController < ActionController::Base
  before_action :authenticate_admin!
  layout 'hq_application'
  self.responder = ApplicationResponder
  respond_to :html, :json
end