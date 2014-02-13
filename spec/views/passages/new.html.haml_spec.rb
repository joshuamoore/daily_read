require 'spec_helper'

describe "passages/new" do
  before(:each) do
    assign(:passage, stub_model(Passage,
      :name => "MyString",
      :text => "MyText"
    ).as_new_record)
  end

  it "renders new passage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", passages_path, "post" do
      assert_select "input#passage_name[name=?]", "passage[name]"
      assert_select "textarea#passage_text[name=?]", "passage[text]"
    end
  end
end
