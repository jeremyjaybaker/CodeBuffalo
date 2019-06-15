class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :ensure_onboarded!

  private

  def ensure_onboarded!
    return unless current_user.present?
    redirect_to onboarding_path unless current_user.is_onboarded?
  end
end
