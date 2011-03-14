class SessionsController < ApplicationController
  def destroy
    sign
    redirect_to root_url
  end
end
