class CreateClases < ActiveRecord::Migration[5.2]
  def change
    create_table :clases do |t|
      t.integer :numero
      t.string :nombre
      t.text :contenido

      t.timestamps
    end
  end
end
