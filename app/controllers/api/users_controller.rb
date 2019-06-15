class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render json: serialize_user
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: 400
  end

  private

  # TODO: if demo db has lots of users, this is going to chug
  def location_for
    Geocoder.search(@user.current_sign_in_ip).first.try(:coordinates)
  end

  def serialize_user
    {
      email: @user.email,
      interests: @user.interest_categories,
      budget: @user.budget_type.name,
      looking_for_group: @user.looking_for_group?,
      last_known_ip: @user.current_sign_in_ip,
      last_known_latitude: location.try(:first),
      last_known_longitude: location.try(:second)
    }
  end
end
