class Forum < ApplicationRecord
  validates :name, presence: true
  belongs_to :course
  has_many :messages, dependent: :destroy
end
