require 'spec_helper'

describe TablesController do
  describe "GET #index" do
    it "lists all the tables" do
      create :table
      create :table, name: "test2"
      get :index  
      assigns[:tables].should eq Table.all
    end
  end

  describe "GET #show" do
    let(:table) { create :table }

    it "gets the table" do
      get :show, id: table.id
      assigns[:table].should eq table
    end
    
    it "can export to CSV" do
      get :show, id: table.id, format: "csv"
      response.status.should eq 200
      response.body.should eq Table.to_csv(table)
    end
  end
end
