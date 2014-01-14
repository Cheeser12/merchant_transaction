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

  def import
    if Table.import(params[:file])
      redirect_to root_url, notice: "Successfully imported #{params[:file].original_filename}"
    else
      redirect_to root_url, alert: "Failed to import #{params[:file].original_filename}"
    end
  end
end
