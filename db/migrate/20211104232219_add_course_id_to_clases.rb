class AddCourseIdToClases < ActiveRecord::Migration[5.2]
  def change
    add_column :clases, :course_id, :integer
  end
end
