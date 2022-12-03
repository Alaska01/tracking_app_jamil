class SearchController < ApplicationController
  def index
    @query =Customer.ransack(params[:q])
    @customers = @query.result(distinct: true)
  end
end
