class AddInstructorToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :instructor, :integer
  end
end
