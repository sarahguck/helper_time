class ToDo < ActiveRecord::Base
  validates_presence_of :name
  belongs_to            :entry
end
