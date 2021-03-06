class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..12

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }, uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]+\z/i }
    validates :birthday
  end
  has_many :user_calenders
  has_many :calenders, through: :user_calenders
end
