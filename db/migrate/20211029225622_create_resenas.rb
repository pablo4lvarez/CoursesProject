class CreateResenas < ActiveRecord::Migration[5.2]
  def change
    create_table :resenas do |t|
      t.integer :calificacion
      t.string :contenido

      t.timestamps
    end
  end
end
