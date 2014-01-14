require 'spec_helper'

describe ReportsController do
  describe "GET #index" do
    it "lists all the tables" do
      create(:table)
      create(:table, name: "test2")
      get :index  
      assigns[:table_ids].should eq Table.all.ids
    end
  end

  describe "GET #show" do
    it "gets the table" do
      table = create(:table)
      get :show, id: table.id
      assigns[:table].should eq table
    end
  end
end
