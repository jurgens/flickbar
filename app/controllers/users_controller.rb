class UsersController < ApplicationController

#  before_filter :authenticate_user!
  before_filter :find_account, :only => [:show]

  def show
    @watches = @account.watches
  end

  def news

  end

protected

  def find_account
    @account = User.find_by_nickname(params[:nickname])
    render :text => '404: page not found', :status => 404 and return if @account.blank?
  end
end
