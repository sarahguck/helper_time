class ToDosController < ApplicationController
  def index
  end

  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.save
    respond_to do |format|
      format.js
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:name, :notes)
  end


end