require 'spec_helper'

describe "applications/edit" do
  before(:each) do
    @application = assign(:application, stub_model(Application,
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :repository_url => "MyString",
      :framework => "MyString"
    ))
  end

  it "renders the edit application form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", application_path(@application), "post" do
      assert_select "input#application_user[name=?]", "application[user]"
      assert_select "input#application_name[name=?]", "application[name]"
      assert_select "textarea#application_description[name=?]", "application[description]"
      assert_select "input#application_repository_url[name=?]", "application[repository_url]"
      assert_select "input#application_framework[name=?]", "application[framework]"
    end
  end
end
