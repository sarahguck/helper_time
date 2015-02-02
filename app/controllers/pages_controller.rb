class PagesController < ApplicationController
  def index
  end

  def schema

  end

  def tag
    @query = params[:query].to_s
    @entries = Entry.where("UPPER(entries.tags) LIKE ? OR UPPER(entries.format) LIKE ?", "%#{@query.upcase}%", "%#{@query.upcase}%")
    respond_to do |format|
      format.js do
        if @entries.size > 0
          render 'pages/add_tab.js'
        else
          @alert = "sorry<br>no entries"
          render 'application/alert.js'
        end
      end
    end
  end

  def format
    @query = params[:query].to_s
    @entries = Entry.where("UPPER(entries.format) LIKE ?", "%#{@query.upcase}%")
    respond_to do |format|
      format.js do
        if @entries.size > 0
          render 'pages/add_tab.js'
        else
          @alert = "sorry<br>no entries"
          render 'application/alert.js'
        end
      end
    end
  end

end