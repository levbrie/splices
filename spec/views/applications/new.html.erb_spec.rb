require 'spec_helper'

describe "applications/new" do
  before(:each) do
    assign(:application, stub_model(Application,
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :repository_url => "MyString",
      :framework => "MyString"
    ).as_new_record)
  end

  it "renders new application form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", applications_path, "post" do
      assert_select "input#application_user[name=?]", "application[user]"
      assert_select "input#application_name[name=?]", "application[name]"
      assert_select "textarea#application_description[name=?]", "application[description]"
      assert_select "input#application_repository_url[name=?]", "application[repository_url]"
      assert_select "input#application_framework[name=?]", "application[framework]"
    end
  end
end
