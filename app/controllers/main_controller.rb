class MainController < ApplicationController
  def index
  end

  def home
    render 'home', user: @user
  end
end
