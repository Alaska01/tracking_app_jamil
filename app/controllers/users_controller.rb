class UsersController < ApplicationController
  def index
    @user = User.all
  end

    private
    def  set_user

    end
end
