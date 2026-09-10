require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
  end

  test "should show the cart" do
    get cart_path
    assert_response :success
  end

  test "should create a cart on first visit for a new user" do
    fresh = User.create!(email: "fresh@example.com", password: "password123")
    sign_in fresh

    assert_nil fresh.cart
    get cart_path
    assert_not_nil fresh.reload.cart
  end

  test "should require sign-in to view the cart" do
    sign_out :user
    get cart_path
    assert_redirected_to new_user_session_path
  end
end
