ActiveAdmin.register Forum do
  permit_params :name, :course_id

    index do
      selectable_column
        id_column
        column :name
        column :course_id
        column :created_at
        actions
    end

    filter :name
    filter :course_id
    filter :created_at

    # form do |f|
    #     f.inputs do
    #     f.input :name
    #     f.input :course_id
    #     end
    #     f.actions
    # end
end