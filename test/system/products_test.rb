require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the shop index shows products" do
    visit root_path

    assert_selector "h1", text: "Products"
    assert_text products(:one).name
  end

  test "visiting a product detail page" do
    visit product_path(products(:one))

    assert_text products(:one).description
  end
end
