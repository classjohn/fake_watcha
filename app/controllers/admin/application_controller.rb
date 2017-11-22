class Admin::ApplicationController < ApplicationController
  before_action :check_admin
  layout 'admin'

  private
  def check_admin
    unless user_signed_in? && current_user.admin?
      redirect_to(root_path, alert: "관리자 계정으로 로그인 하셔야 되용")
    end
  end
end
