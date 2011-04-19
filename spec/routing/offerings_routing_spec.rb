require "spec_helper"

describe OfferingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/offerings" }.should route_to(:controller => "offerings", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/offerings/new" }.should route_to(:controller => "offerings", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/offerings/1" }.should route_to(:controller => "offerings", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/offerings/1/edit" }.should route_to(:controller => "offerings", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/offerings" }.should route_to(:controller => "offerings", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/offerings/1" }.should route_to(:controller => "offerings", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/offerings/1" }.should route_to(:controller => "offerings", :action => "destroy", :id => "1")
    end

  end
end
