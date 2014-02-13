require 'spec_helper'

describe "passages/edit" do
  before(:each) do
    @passage = assign(:passage, stub_model(Passage,
      :name => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit passage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passage_path(@passage), "post" do
      assert_select "input#passage_name[name=?]", "passage[name]"
      assert_select "textarea#passage_text[name=?]", "passage[text]"
    end
  end
end
