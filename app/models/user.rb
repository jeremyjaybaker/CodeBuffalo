class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :trackable

  INTEREST_CATEGORY_TYPES = [
    'Fitness',
    'Learning',
    'Volunteering',
    'Gaming',
    'Music',
    'Surprise Me!'
  ].freeze

  validates :looking_for_group, inclusion: { in: [true, false] }
  belongs_to :budget_type, optional: true
end
