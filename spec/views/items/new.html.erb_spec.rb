require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/new.html.erb" do
  include ItemsHelper
  
  before(:each) do
    @item = mock_model(Item)
    @item.stub!(:new_record?).and_return(true)
    @item.stub!(:name).and_return("MyString")
    @item.stub!(:desc).and_return("MyText")
    @item.stub!(:deposit).and_return("1.5")
    assigns[:item] = @item
  end

  it "should render new form" do
    render "/items/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", items_path) do
      with_tag("input#item_name[name=?]", "item[name]")
      with_tag("textarea#item_desc[name=?]", "item[desc]")
      with_tag("input#item_deposit[name=?]", "item[deposit]")
    end
  end
end


