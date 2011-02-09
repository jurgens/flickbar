class UsersController < ApplicationController

  before_filter :find_user, :only => [:show]

  def show
    
  end

protected

  def find_user
    @user = User.find_by_nickname(params[:nickname])
    render :text => '404: page not found', :status => 404 and return if @user.blank?
  end
end
