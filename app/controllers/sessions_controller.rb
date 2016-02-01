class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      log_in!(user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Bad username / password combo"]
      render :new
    end
  end

  def destroy
    log_out
    render json: {}
  end
end
