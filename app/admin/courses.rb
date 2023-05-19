ActiveAdmin.register Course do
  permit_params :name, :description, :category, :user_id

    index do 
      selectable_column
        id_column
        column :name
        column :description
        column :category
        column :created_at
        column :user_id
        actions
    end

    filter :name
    filter :description
    filter :category
    filter :created_at
    filter :user_id

    # form do |f|
    #     f.inputs do
    #     f.input :name
    #     f.input :description
    #     f.input :category
    #     end
    #     f.actions
    # end


end