class AddNotifyParamsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :send_sms, :boolean, default: false
    add_column :users, :send_email, :boolean, default: false
  end
end
