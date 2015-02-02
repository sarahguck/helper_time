class TodayController < ApplicationController
  def index
  end

  def sort_dailies
    @pos = params[:positions]
    dailies = Entry.where(:daily => true)
    dailies.each do |daily|
      pos = params[:positions][daily.id.to_s]
      daily.update_attribute(:daily_order, pos.to_i)
    end
    render :nothing => true
  end

  def remove_daily
    @entry = Entry.find(params[:id])
    @entry.update_attribute(:daily, false)
    respond_to do |format|
      format.js
    end
  end

end