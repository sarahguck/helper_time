class EntriesController < ApplicationController

  def create
    @entry = Entry.new(entry_params)
    @entry.save
    respond_to do |format|
      format.js
    end
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update_attributes(entry_params)
    respond_to do |format|
      format.js do
        render 'update.js'
      end
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.js
    end
  end

  def show
    @entry = Entry.find(params[:id])
    respond_to do |format|
      format.js do
        render 'show.js'
      end
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :notes, :visual, :daily, :daily_order, :daily_completed, :progress, :total, :tags, :format)
  end

end