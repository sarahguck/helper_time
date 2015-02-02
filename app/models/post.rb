class Post < ActiveRecord::Base
  validates_presence_of :content
  belongs_to            :entry

  def date
    created_at.strftime('%^a, %e %^b, %H:%M')
  end
end
