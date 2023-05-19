class AddCourseIdToResenas < ActiveRecord::Migration[5.2]
  def change
    add_column :resenas, :course_id, :integer
  end
end
