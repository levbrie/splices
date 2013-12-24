require 'spec_helper'

describe "applications/show" do
  before(:each) do
    @application = assign(:application, stub_model(Application,
      :user => nil,
      :name => "Name",
      :description => "MyText",
      :repository_url => "Repository Url",
      :framework => "Framework"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Repository Url/)
    rendered.should match(/Framework/)
  end
end
