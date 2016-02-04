class StaticPagesController < ApplicationController
  def show
    @user = current_user
  end

  def about
    @user = current_user
  end
end
