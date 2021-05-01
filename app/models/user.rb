class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations
  has_many :outfits

  def full_name
    "#{first_name} #{last_name}"
  end
  has_many :outfits, :dependent => :delete_all
end
