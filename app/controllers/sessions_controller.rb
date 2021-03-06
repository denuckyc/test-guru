class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:redirect_url] || root_path
    else
      flash_message :alert, 'Неверный логин или пароль. Повторите попытку.'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
