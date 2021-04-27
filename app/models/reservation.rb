class Reservation < ApplicationRecord
  belongs_to :outfit
  belongs_to :user
end
