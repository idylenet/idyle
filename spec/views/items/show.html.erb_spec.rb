require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/show.html.erb" do
  include ItemsHelper
  
  before(:each) do
    @item = mock_model(Item)
    @item.stub!(:name).and_return("MyString")
    @item.stub!(:desc).and_return("MyText")
    @item.stub!(:deposit).and_return("1.5")

    assigns[:item] = @item
  end

  it "should render attributes in <p>" do
    render "/items/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/1\.5/)
  end
end

