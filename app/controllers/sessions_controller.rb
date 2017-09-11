class SessionsController < ApplicationController
  def new
  end

  def sms_login
    
  end

  def send_code
    user = User.find_by phone: session_params[:phone]
    if user
      user.send_code!
      session[:phone] = session_params[:phone]
      @phone = user.phone
    else
      @message = 'User not found'
      render :sms_login
    end
  end

  def verify_code
    user = User.find_by phone: session[:phone]
    if user && (user.code == session_params[:code])
      session[:phone] = nil
      session[:user_id] = user.id
      redirect_to root_path
    else
      @message = 'Не верный код'
      render :send_code
    end
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def session_params
      params.require(:session).permit(
        :email, 
        :password,
        :phone,
        :code
      )
    end
    
end
