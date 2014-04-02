class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  has_many :logins
  
  def update_logins
    self.logins.create(sign_in_ip: self.current_sign_in_ip, sign_in_at: self.current_sign_in_at)
    self.logins.offset(5).destroy_all
  end
end
