class Event < ApplicationRecord
  validates_presence_of :title, :description, :duration, :price
end
