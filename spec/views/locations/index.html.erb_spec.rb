require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/index.html.erb" do
  include LocationsHelper
  
  before(:each) do
    location_98 = mock_model(Location)
    location_98.should_receive(:name).and_return("MyString")
    location_98.should_receive(:line1).and_return("MyString")
    location_98.should_receive(:line2).and_return("MyString")
    location_98.should_receive(:region).and_return("MyString")
    location_98.should_receive(:zipcode).and_return("MyString")
    location_98.should_receive(:country).and_return("MyString")
    location_99 = mock_model(Location)
    location_99.should_receive(:name).and_return("MyString")
    location_99.should_receive(:line1).and_return("MyString")
    location_99.should_receive(:line2).and_return("MyString")
    location_99.should_receive(:region).and_return("MyString")
    location_99.should_receive(:zipcode).and_return("MyString")
    location_99.should_receive(:country).and_return("MyString")

    assigns[:locations] = [location_98, location_99]
  end

  it "should render list of locations" do
    render "/locations/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end
