class RenamePrifileImageIdColumToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :prifile_image_id, :profile_image_id
  end
end
