class AddProfImageIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prof_image_id, :string
  end
end
