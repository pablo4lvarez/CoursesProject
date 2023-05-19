ActiveAdmin.register Clase do
  permit_params :course_id, :numero, :nombre, :contenido

    index do
      selectable_column
        id_column
        column :course_id
        column :numero
        column :nombre
        column :contenido
        column :created_at
        actions
    end

    filter :course_id
    filter :numero
    filter :nombre
    filter :contenido
    filter :created_at

    # form do |f|
    #     f.inputs do
    #     f.input :course_id
    #     f.input :numero
    #     f.input :nombre
    #     f.input :contenido
    #     end
    #     f.actions
    # end


end