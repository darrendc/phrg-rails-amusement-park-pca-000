# frozen_string_literal: true

class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_id(params[:user][:name])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session.delete :user_id if logged_in?
    redirect_to "/"
  end
end
