require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/items/edit.html.erb" do
  include ItemsHelper
  
  before do
    @item = mock_model(Item)
    @item.stub!(:name).and_return("MyString")
    @item.stub!(:desc).and_return("MyText")
    @item.stub!(:deposit).and_return("1.5")
    assigns[:item] = @item
  end

  it "should render edit form" do
    render "/items/edit.html.erb"
    
    response.should have_tag("form[action=#{item_path(@item)}][method=post]") do
      with_tag('input#item_name[name=?]', "item[name]")
      with_tag('textarea#item_desc[name=?]', "item[desc]")
      with_tag('input#item_deposit[name=?]', "item[deposit]")
    end
  end
end


