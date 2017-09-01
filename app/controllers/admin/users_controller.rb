class Admin::UsersController < ApplicationController

  before_action :check_admin
  layout 'admin'

  def index
  end
end
