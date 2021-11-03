class Shop < ApplicationRecord
  
  belongs_to :user
  attachment :image
  
  with_options presence: true do
    validates :title
    validates :shop_address
    validates :body
  end

end
