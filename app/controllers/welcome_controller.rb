class WelcomeController < ApplicationController
  before_action :sign_in

  private

  def sign_in
    redirect_to users_dashboards_index_path if user_signed_in?
  end
end
