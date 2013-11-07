class StaticPagesController < ApplicationController
  before_action :signed_in_user
  
  def home
  end
  
  def time
    @employees = Employee.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
