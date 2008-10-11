require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemsController do
  describe "route generation" do

    it "should map { :controller => 'items', :action => 'index' } to /items" do
      route_for(:controller => "items", :action => "index").should == "/items"
    end
  
    it "should map { :controller => 'items', :action => 'new' } to /items/new" do
      route_for(:controller => "items", :action => "new").should == "/items/new"
    end
  
    it "should map { :controller => 'items', :action => 'show', :id => 1 } to /items/1" do
      route_for(:controller => "items", :action => "show", :id => 1).should == "/items/1"
    end
  
    it "should map { :controller => 'items', :action => 'edit', :id => 1 } to /items/1/edit" do
      route_for(:controller => "items", :action => "edit", :id => 1).should == "/items/1/edit"
    end
  
    it "should map { :controller => 'items', :action => 'update', :id => 1} to /items/1" do
      route_for(:controller => "items", :action => "update", :id => 1).should == "/items/1"
    end
  
    it "should map { :controller => 'items', :action => 'destroy', :id => 1} to /items/1" do
      route_for(:controller => "items", :action => "destroy", :id => 1).should == "/items/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'items', action => 'index' } from GET /items" do
      params_from(:get, "/items").should == {:controller => "items", :action => "index"}
    end
  
    it "should generate params { :controller => 'items', action => 'new' } from GET /items/new" do
      params_from(:get, "/items/new").should == {:controller => "items", :action => "new"}
    end
  
    it "should generate params { :controller => 'items', action => 'create' } from POST /items" do
      params_from(:post, "/items").should == {:controller => "items", :action => "create"}
    end
  
    it "should generate params { :controller => 'items', action => 'show', id => '1' } from GET /items/1" do
      params_from(:get, "/items/1").should == {:controller => "items", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'items', action => 'edit', id => '1' } from GET /items/1;edit" do
      params_from(:get, "/items/1/edit").should == {:controller => "items", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'items', action => 'update', id => '1' } from PUT /items/1" do
      params_from(:put, "/items/1").should == {:controller => "items", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'items', action => 'destroy', id => '1' } from DELETE /items/1" do
      params_from(:delete, "/items/1").should == {:controller => "items", :action => "destroy", :id => "1"}
    end
  end
end
