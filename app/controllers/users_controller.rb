class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @prototype = Prototype.includes(:user)
    
    
  end

end
