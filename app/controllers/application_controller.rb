class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_entries
  before_filter :get_dailies
  before_filter :get_to_dos
  before_filter :get_posts

  def get_entries
    @entries = Entry.all
  end

  def get_dailies
    @dailies = Entry.order('daily_order ASC').where(daily: true)
  end

  def get_books
    @books = @entries.where(format: 'book')
  end

  def get_posts
    @posts = Post.order('created_at DESC')
  end

  def get_to_dos
    @to_dos = ToDo.all
  end
end
