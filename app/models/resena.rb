class Resena < ApplicationRecord
  belongs_to :course
  belongs_to :user
  validates :calificacion, presence: true, numericality: { only_integer: true }
  validate :calificacion_no_puede_estar_fuera_de_rango
    # validates que esté entre 1 y 5 la calificacion
  def calificacion_no_puede_estar_fuera_de_rango
    if calificacion == nil
      errors.add(:calificacion, "No puede ser nulo")
    elsif calificacion > 5 || calificacion < 1
      errors.add(:calificacion, "No puede estar fuera del rango 1-5")
    end
  end
end
