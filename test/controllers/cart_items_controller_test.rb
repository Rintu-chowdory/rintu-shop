require "test_helper"

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @product = products(:one)
    sign_in @user
  end

  test "should add a new product to the cart" do
    assert_difference "@user.cart.cart_items.count" do
      post cart_items_path, params: { product_id: products(:two).id }
    end

    assert_redirected_to cart_path
  end

  test "should increment quantity when adding the same product twice" do
    assert_no_difference "@user.cart.cart_items.count" do
      post cart_items_path, params: { product_id: @product.id }
      post cart_items_path, params: { product_id: @product.id }
    end

    assert_equal 3, @user.cart.cart_items.find_by(product: @product).quantity
  end

  test "should remove an item from the cart" do
    post cart_items_path, params: { product_id: @product.id }
    cart_item = @user.cart.cart_items.find_by(product: @product)

    assert_difference "CartItem.count", -1 do
      delete cart_item_path(cart_item)
    end

    assert_redirected_to cart_path
  end

  test "should require sign-in to add items" do
    sign_out :user

    assert_no_difference "CartItem.count" do
      post cart_items_path, params: { product_id: @product.id }
    end

    assert_redirected_to new_user_session_path
  end
end
