class Conversation < ApplicationRecord
# associations
belongs_to :connection, :foreign_key => "connections_id"

# validations
validates :location, :presence => { :message => "Please add location (method) of conversation" }
validates :date, :length => { :minimum => 1, :maximum => 160 }
validates :date, :presence => true
validates :date, :uniqueness => { :scope => [:connections_id], :message => "You already have a conversation on this date, would you like to add more?" }

end
