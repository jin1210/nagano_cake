class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  def full_name
    self.last_name + " " + self.first_name
  end
  
  def address_display
   '〒' + postal_code + ' ' + address + ' ' + last_name + ' ' + first_name
  end

  validates :is_active, inclusion: {in: [true, false]}

end
