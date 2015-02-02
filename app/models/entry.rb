class Entry < ActiveRecord::Base
  FORMATS = ['book', 'coursera', 'paper']

  default_scope { order(order: :asc) }
  validates_presence_of :name
  has_many              :posts
  has_many              :to_dos

  def self.formats
    FORMATS
  end
end