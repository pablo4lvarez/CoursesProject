class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses_users, dependent: :destroy
  has_many :courses, through: :courses_users
  has_many :messages, dependent: :destroy
  has_many :resenas, dependent: :destroy
  validates :name, presence: true
  validates :last_name, presence: true
  #validates :password, presence: true, uniqueness: true
  has_one_attached :image
end
