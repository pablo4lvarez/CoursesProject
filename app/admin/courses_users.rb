ActiveAdmin.register CoursesUser do
  permit_params :course_id, :user_id

    index do
      selectable_column
        id_column
        column :course_id
        column :user_id
        actions
    end

    filter :course_id
    filter :user_id

    # form do |f|
    #     f.inputs do
    #     f.input :course_id
    #     f.input :user_id
    #     end
    #     f.actions
    # end
end