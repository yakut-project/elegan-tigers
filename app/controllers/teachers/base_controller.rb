require 'application_responder'

class Teachers::BaseController < ActionController::Base
  before_action :authenticate_teacher!
  layout 'teacher_application'
  self.responder = ApplicationResponder
  respond_to :html, :json
end