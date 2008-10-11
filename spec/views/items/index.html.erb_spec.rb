require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/index.html.erb" do
  include ItemsHelper
  
  before(:each) do
    item_98 = mock_model(Item)
    item_98.should_receive(:name).and_return("MyString")
    item_98.should_receive(:desc).and_return("MyText")
    item_98.should_receive(:deposit).and_return("1.5")
    item_99 = mock_model(Item)
    item_99.should_receive(:name).and_return("MyString")
    item_99.should_receive(:desc).and_return("MyText")
    item_99.should_receive(:deposit).and_return("1.5")

    assigns[:items] = [item_98, item_99]
  end

  it "should render list of items" do
    render "/items/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "1.5", 2)
  end
end

