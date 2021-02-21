class WelcomeController < CheckinsController
  before_action :check_is_admin_loged_in

  def index
  end

  private
  def check_is_admin_loged_in
    if !admin_signed_in?
      redirect_to new_attendace_path
    end
  end
end
