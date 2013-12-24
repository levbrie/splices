require 'spec_helper'

describe "components/show" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :name => "Name",
      :description => "MyText",
      :repository_url => "Repository Url",
      :component_path => "Component Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Repository Url/)
    rendered.should match(/Component Path/)
  end
end
