require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/locations/show.html.erb" do
  include LocationsHelper
  
  before(:each) do
    @location = mock_model(Location)
    @location.stub!(:name).and_return("MyString")
    @location.stub!(:line1).and_return("MyString")
    @location.stub!(:line2).and_return("MyString")
    @location.stub!(:region).and_return("MyString")
    @location.stub!(:zipcode).and_return("MyString")
    @location.stub!(:country).and_return("MyString")

    assigns[:location] = @location
  end

  it "should render attributes in <p>" do
    render "/locations/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

