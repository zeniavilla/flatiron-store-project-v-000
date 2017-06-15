class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :carts
  has_many :orders
  belongs_to :current_cart, class_name: "Cart"

  def set_current_cart
    new_cart = self.carts.create
    self.current_cart_id = new_cart.id
    self.save
  end

  def reset_current_cart
    self.update(current_cart_id: nil)
  end

end
