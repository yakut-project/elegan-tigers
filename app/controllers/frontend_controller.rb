class FrontendController < ApplicationController
  before_filter :authenticate_teacher!, only:[:teachersindex]
  before_filter :authenticate_user!, only:[:usersindex]
  def index
  end


end
