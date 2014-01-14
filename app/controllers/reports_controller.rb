require 'csv'

class ReportsController < ApplicationController
  def index
    @table_ids = Table.all.ids
  end

  def show
    respond_to do |format|
      format.html
      format.csv
    end

    @table = Table.find(params[:id])
  end
end
