require 'spec_helper'

describe ReportsController do
  describe "GET #index" do
    it "lists all the tables" do
      create :table
      create :table, name: "test2"
      get :index  
      assigns[:tables].should eq Table.all
    end
  end

  describe "GET #show" do
    it "gets the table" do
      table = create :table
      get :show, id: table.id
      assigns[:table].should eq table
    end
  end
end
