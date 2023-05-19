ActiveAdmin.register Resena do
  permit_params :calificacion, :contenido, :user_id, :course_id

    index do
      selectable_column
        id_column
        column :calificacion
        column :contenido
        column :user_id
        column :course_id
        column :created_at
        actions
    end

    filter :calificacion
    filter :contenido
    filter :user_id
    filter :course_id
    filter :created_at

    # form do |f|
    #     f.inputs do
    #     f.input :calificacion
    #     f.input :contenido
    #     f.input :user_id
    #     f.input :course_id
    #     end
    #     f.actions
    # end


end