require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemsController do
  describe "handling GET /items" do

    before(:each) do
      @item = mock_model(Item)
      Item.stub!(:find).and_return([@item])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all items" do
      Item.should_receive(:find).with(:all).and_return([@item])
      do_get
    end
  
    it "should assign the found items for the view" do
      do_get
      assigns[:items].should == [@item]
    end
  end

  describe "handling GET /items.xml" do

    before(:each) do
      @items = mock("Array of Items", :to_xml => "XML")
      Item.stub!(:find).and_return(@items)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all items" do
      Item.should_receive(:find).with(:all).and_return(@items)
      do_get
    end
  
    it "should render the found items as xml" do
      @items.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /items/1" do

    before(:each) do
      @item = mock_model(Item)
      Item.stub!(:find).and_return(@item)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the item requested" do
      Item.should_receive(:find).with("1").and_return(@item)
      do_get
    end
  
    it "should assign the found item for the view" do
      do_get
      assigns[:item].should equal(@item)
    end
  end

  describe "handling GET /items/1.xml" do

    before(:each) do
      @item = mock_model(Item, :to_xml => "XML")
      Item.stub!(:find).and_return(@item)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the item requested" do
      Item.should_receive(:find).with("1").and_return(@item)
      do_get
    end
  
    it "should render the found item as xml" do
      @item.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /items/new" do

    before(:each) do
      @item = mock_model(Item)
      Item.stub!(:new).and_return(@item)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new item" do
      Item.should_receive(:new).and_return(@item)
      do_get
    end
  
    it "should not save the new item" do
      @item.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new item for the view" do
      do_get
      assigns[:item].should equal(@item)
    end
  end

  describe "handling GET /items/1/edit" do

    before(:each) do
      @item = mock_model(Item)
      Item.stub!(:find).and_return(@item)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the item requested" do
      Item.should_receive(:find).and_return(@item)
      do_get
    end
  
    it "should assign the found Item for the view" do
      do_get
      assigns[:item].should equal(@item)
    end
  end

  describe "handling POST /items" do

    before(:each) do
      @item = mock_model(Item, :to_param => "1")
      Item.stub!(:new).and_return(@item)
    end
    
    describe "with successful save" do
  
      def do_post
        @item.should_receive(:save).and_return(true)
        post :create, :item => {}
      end
  
      it "should create a new item" do
        Item.should_receive(:new).with({}).and_return(@item)
        do_post
      end

      it "should redirect to the new item" do
        do_post
        response.should redirect_to(item_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @item.should_receive(:save).and_return(false)
        post :create, :item => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /items/1" do

    before(:each) do
      @item = mock_model(Item, :to_param => "1")
      Item.stub!(:find).and_return(@item)
    end
    
    describe "with successful update" do

      def do_put
        @item.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the item requested" do
        Item.should_receive(:find).with("1").and_return(@item)
        do_put
      end

      it "should update the found item" do
        do_put
        assigns(:item).should equal(@item)
      end

      it "should assign the found item for the view" do
        do_put
        assigns(:item).should equal(@item)
      end

      it "should redirect to the item" do
        do_put
        response.should redirect_to(item_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @item.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /items/1" do

    before(:each) do
      @item = mock_model(Item, :destroy => true)
      Item.stub!(:find).and_return(@item)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the item requested" do
      Item.should_receive(:find).with("1").and_return(@item)
      do_delete
    end
  
    it "should call destroy on the found item" do
      @item.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the items list" do
      do_delete
      response.should redirect_to(items_url)
    end
  end
end
