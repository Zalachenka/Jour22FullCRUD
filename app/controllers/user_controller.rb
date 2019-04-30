class UserController < ApplicationController
  def user
  @user = User.all.find(params[:id])
  end
end
