class UsersController < ApplicationController
  def show
    if !current_user
      redirect_to "/login"
    else
      @user = User.find_by(id: current_user.id)
    end
  end

  def new
    if current_user
      redirect_to "/games"
    else
      @user = User.new
      render template: "users/new"
    end
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
      admin: false,
    )
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end
end
