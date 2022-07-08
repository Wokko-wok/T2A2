require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      user: nil,
      species: "MyString",
      age: 1,
      price: 1,
      name: "MyString",
      description: nil,
      sold: false
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[species]"

      assert_select "input[name=?]", "listing[age]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[name]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[sold]"
    end
  end
end
