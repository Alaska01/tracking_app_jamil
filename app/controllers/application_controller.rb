class ApplicationController < ActionController::Base
  before_action :set_query
  
  def set_query
    @query =Customer.ransack(params[:q])
  end

end
