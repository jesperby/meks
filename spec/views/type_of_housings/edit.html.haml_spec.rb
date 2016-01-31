require 'rails_helper'

RSpec.describe "type_of_housings/edit", type: :view do
  before(:each) do
    @type_of_housing = assign(:type_of_housing, TypeOfHousing.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit type_of_housing form" do
    render

    assert_select "form[action=?][method=?]", type_of_housing_path(@type_of_housing), "post" do

      assert_select "input#type_of_housing_name[name=?]", "type_of_housing[name]"
    end
  end
end