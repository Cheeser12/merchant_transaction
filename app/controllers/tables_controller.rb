require 'csv'

class TablesController < ApplicationController
  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])

    respond_to do |format|
      format.html
      format.csv { send_data Table.to_csv(@table), filename: "#{@table.name}.csv" }
    end
  end
end
