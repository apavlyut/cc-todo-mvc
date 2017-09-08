class AccountsController < ApplicationController
  def show
  end

  def update
    current_user.update(account_params)
    redirect_to account_path      
  end

  private
    def account_params
      params.require(:user).permit(
        :send_sms, 
        :send_email
      )
    end
end
