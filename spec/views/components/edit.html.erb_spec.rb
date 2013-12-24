require 'spec_helper'

describe "components/edit" do
  before(:each) do
    @component = assign(:component, stub_model(Component,
      :name => "MyString",
      :description => "MyText",
      :repository_url => "MyString",
      :component_path => "MyString"
    ))
  end

  it "renders the edit component form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", component_path(@component), "post" do
      assert_select "input#component_name[name=?]", "component[name]"
      assert_select "textarea#component_description[name=?]", "component[description]"
      assert_select "input#component_repository_url[name=?]", "component[repository_url]"
      assert_select "input#component_component_path[name=?]", "component[component_path]"
    end
  end
end
