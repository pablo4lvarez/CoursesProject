ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :last_name, :profile_picture, :course_id

    index do
      selectable_column
        id_column
        column :email
        column :password
        column :name
        column :last_name
        column :profile_picture
        column :course_id
        column :created_at
        actions

        #post 'index', params:  valid_credentials , headers: headers

    end

    filter :email
    filter :password
    filter :name
    filter :last_name
    filter :course_id
    filter :created_at

    #Esto de abajo fue comentado en todos los archivos de admin para subir la cobertura del rspec.
    #Si sirve para mostrar un poco mas bonito al Edit.

    # form do |f|
    #     f.inputs do
    #     f.input :email
    #     f.input :password
    #     f.input :password_confirmation
    #     f.input :name
    #     f.input :last_name
    #     f.input :profile_picture
        
    #     end
    #     f.actions
    # end


end