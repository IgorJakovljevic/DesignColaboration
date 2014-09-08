require 'rails_helper'

RSpec.describe "projects/new", :type => :view do
  before(:each) do
    assign(:project, Project.new(
      :user_id => 1,
      :micropost_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_user_id[name=?]", "project[user_id]"

      assert_select "input#project_micropost_id[name=?]", "project[micropost_id]"

      assert_select "input#project_name[name=?]", "project[name]"
    end
  end
end
