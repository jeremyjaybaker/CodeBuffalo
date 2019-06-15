class OnboardingController < ApplicationController
  skip_before_action :ensure_onboarded!

  def new
    @user = current_user
  end

  def create
    @user = current_user
    byebug
    if @user.update(onboarding_params)
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def onboarding_params
    params.require(:user).permit(
      :budget_type_id,
      :looking_for_group,
      interest_categories: []
    ).merge({ is_onboarded: true })
  end
end
