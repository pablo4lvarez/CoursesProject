class Message < ApplicationRecord
  validates :contenido, presence: true
  belongs_to :user
  belongs_to :forum
  accepts_nested_attributes_for :forum  
end
