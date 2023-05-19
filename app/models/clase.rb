class Clase < ApplicationRecord
  validates :numero, presence: true
  validates :nombre, presence: true
  validates :contenido, presence: true
  belongs_to :course
end
