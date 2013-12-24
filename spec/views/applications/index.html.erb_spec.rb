require 'spec_helper'

describe "applications/index" do
  before(:each) do
    assign(:applications, [
      stub_model(Application,
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :repository_url => "Repository Url",
        :framework => "Framework"
      ),
      stub_model(Application,
        :user => nil,
        :name => "Name",
        :description => "MyText",
        :repository_url => "Repository Url",
        :framework => "Framework"
      )
    ])
  end

  it "renders a list of applications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Repository Url".to_s, :count => 2
    assert_select "tr>td", :text => "Framework".to_s, :count => 2
  end
end
