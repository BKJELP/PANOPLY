class Reservation < ApplicationRecord
  belongs_to :outfit
  belongs_to :user

  validates :status, inclusion: { in: %w(pending validated canceled) }

  scope :pendings, -> { where status: 'pending' }
  scope :validated, -> { where status: 'validated' }
  scope :canceled, -> { where status: 'canceled'}
end
