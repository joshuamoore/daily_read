require 'spec_helper'

describe "passages/show" do
  before(:each) do
    @passage = assign(:passage, stub_model(Passage,
      :name => "Name",
      :text => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
