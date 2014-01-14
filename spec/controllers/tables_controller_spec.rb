require 'spec_helper'

describe TablesController do
  let(:table) { create :table }
  describe "tables#index" do
    it "lists all the tables" do
      create :table
      create :table, name: "test2"
      get :index  
      assigns[:tables].should eq Table.all
    end
  end

  describe "tables#show" do
    it "gets the table" do
      get :show, id: table.id
      assigns[:table].should eq table
    end
    
    it "can export to CSV" do
      get :show, id: table.id, format: "csv"
      response.should be_success
      response.body.should eq Table.to_csv(table)
    end
  end

  describe "tables#import" do
    let(:table_name) { "import_test" }
    let(:file) { fixture_file_upload "files/#{table_name}.csv", 'text/csv'}

    it "imports a table from CSV" do
      post :import, file: file 

      response.should redirect_to(root_path)

      # A notice flash means the import was successful
      flash[:notice].should_not be_nil

      # Check that the newly created table exists and contains the
      # correct data
      table = Table.where(name: table_name)[0]
      table.headers.should eq ['field1', 'field2', 'field3']
      table.rows.should eq [['1', '2', '3'], ['4', '5', '6']]
    end
  end

  describe "tables#destroy" do
    it "deletes the table and redirects to the index" do
      post :destroy, id: table.id
      expect { Table.find(table.id) }.to raise_error(ActiveRecord::RecordNotFound)
      response.should redirect_to root_path
    end
  end
end
