class Course < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  has_many :resenas, dependent: :destroy
  has_many :clases, dependent: :destroy
  has_many :forums, dependent: :destroy
  has_many :courses_users, dependent: :destroy
  has_many :users, through: :courses_users

# con esto se agregó course_id a las resenas y clases, 
# solucionando el problema que teniamos en un principio para borrar cursos
# https://qastack.mx/programming/4834809/adding-a-column-to-an-existing-table-in-a-rails-migration


  #https://apidock.com/rails/ActiveRecord/Calculations/pluck
  def average_rating(id)
    resenas = Resena.all.pluck(:course_id, :calificacion)
    suma = 0
    cantidad = 0
    resenas.each do |res|
      if res[0] == id
        cantidad += 1
          suma += res[1].to_int
      end
    end
    average = suma / cantidad.to_f
    return average.truncate(1)
  end

end
