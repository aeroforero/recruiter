class Connection < ApplicationRecord
# associations
belongs_to :user
has_many :conversations, :foreign_key => "connections_id", :dependent => :destroy

# validations
validates :first_name, :presence => { :message => "Name can't be blank" }
validates :first_name, :uniqueness => { :scope => [:email] }
validates :email, :presence => true
validates :email, :uniqueness => true

end
