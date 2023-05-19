class AddUserIdToResenas < ActiveRecord::Migration[5.2]
  def change
    add_column :resenas, :user_id, :integer
  end
end
