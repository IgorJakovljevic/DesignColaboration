require 'rails_helper'

RSpec.describe "tasks/new", :type => :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :description => "MyString",
      :user_id => 1,
      :project_id => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_name[name=?]", "task[name]"

      assert_select "input#task_description[name=?]", "task[description]"

      assert_select "input#task_user_id[name=?]", "task[user_id]"

      assert_select "input#task_project_id[name=?]", "task[project_id]"
    end
  end
end
