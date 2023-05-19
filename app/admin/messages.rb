ActiveAdmin.register Message do
  permit_params :contenido, :forum_id, :user_id

    index do
      selectable_column
        id_column
        column :contenido
        column :forum_id
        column :user_id
        column :created_at
        actions
    end

    filter :contenido
    filter :forum_id
    filter :user_id
    filter :created_at

    # form do |f|
    #     f.inputs do
    #     f.input :contenido
    #     f.input :forum_id
    #     f.input :user_id
    #     end
    #     f.actions
    # end





end