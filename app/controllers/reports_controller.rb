require 'csv'

class ReportsController < ApplicationController
  def index
  end

  def show
    respond_to do |format|
      format.html
      format.csv
    end
  end
end
