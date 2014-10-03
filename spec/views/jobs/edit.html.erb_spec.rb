require 'rails_helper'

RSpec.describe "jobs/edit", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :name => "MyString",
      :rate => 1
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

      assert_select "input#job_name[name=?]", "job[name]"

      assert_select "input#job_rate[name=?]", "job[rate]"
    end
  end
end
