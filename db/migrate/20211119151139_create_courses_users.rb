class CreateCoursesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :courses_users do |t|
      t.references :course, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
