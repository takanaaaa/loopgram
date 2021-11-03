class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.integer :user_id
      t.string :title
      t.string :shop_address
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
