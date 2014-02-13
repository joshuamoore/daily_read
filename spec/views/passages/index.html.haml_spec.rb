require 'spec_helper'

describe "passages/index" do
  before(:each) do
    assign(:passages, [
      stub_model(Passage,
        :name => "Name",
        :text => "MyText"
      ),
      stub_model(Passage,
        :name => "Name",
        :text => "MyText"
      )
    ])
  end

  it "renders a list of passages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
