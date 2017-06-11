class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

# associations
has_many :connections, :dependent => :destroy

# validations
validates :phone, :presence => true
validates :phone, :uniqueness => true
validates :last_name, :presence => true
validates :first_name, :presence => true
validates :birthday, :presence => true

end
