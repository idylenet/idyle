require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/new.html.erb" do
  include LocationsHelper
  
  before(:each) do
    @location = mock_model(Location)
    @location.stub!(:new_record?).and_return(true)
    @location.stub!(:name).and_return("MyString")
    @location.stub!(:line1).and_return("MyString")
    @location.stub!(:line2).and_return("MyString")
    @location.stub!(:region).and_return("MyString")
    @location.stub!(:zipcode).and_return("MyString")
    @location.stub!(:country).and_return("MyString")
    assigns[:location] = @location
  end

  it "should render new form" do
    render "/locations/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", locations_path) do
      with_tag("input#location_name[name=?]", "location[name]")
      with_tag("input#location_line1[name=?]", "location[line1]")
      with_tag("input#location_line2[name=?]", "location[line2]")
      with_tag("input#location_region[name=?]", "location[region]")
      with_tag("input#location_zipcode[name=?]", "location[zipcode]")
      with_tag("input#location_country[name=?]", "location[country]")
    end
  end
end


