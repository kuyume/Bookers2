class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :prof_image
         
  validates :name, length: { in: 2..20, too_short: "is too short(minimum is 2 characters)", too_long: "is too long(maximum is 20 characters)"}
  validate :add_error,on: :update
  def add_error
    if intro.length > 50
        errors[:base] << "Introduction is too long(maximum is 50 characters)"
    end
  end
  
  has_many :books, dependent: :destroy
end
