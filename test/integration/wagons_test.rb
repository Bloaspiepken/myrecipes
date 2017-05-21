require 'test_helper'

class WagonsTest < ActionDispatch::IntegrationTest
  
  def setup
    @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com",
                              password: "password", password_confirmation: "password")
    @wagon = Wagon.create(name: "philip", description: "Dwaallicht", corsogroup: @corsogroup)
    @wagon2 = @corsogroup.wagons.build(name: "philip", description: "Honden")
    @wagon2.save
  end
  
  
  
  test "should get wagons index" do
    get wagons_path
    assert_response :success
  end
  
  test "should get wagons listing" do
    get wagons_path
    assert_template 'wagons/index'
    assert_select "a[href=?]", wagon_path(@wagon), text: @wagon.name
    assert_select "a[href=?]", wagon_path(@wagon2), text: @wagon.name
  end
  
  test "should get wagons show" do
    sign_in_as(@corsogroup, "password")
    get wagon_path(@wagon)
    assert_template 'wagons/show'
    assert_match @wagon.name, response.body
    assert_match @wagon.description, response.body
    assert_match @corsogroup.corsoname, response.body
    assert_select 'a[href=?]', edit_wagon_path(@wagon), text: "Edit this float"
    assert_select 'a[href=?]', wagon_path(@wagon), text: "Delete this float"
    assert_select 'a[href=?]', wagons_path, text: "Return to floats listing"
  end
  
  test "create new valid wagon" do
    sign_in_as(@corsogroup, "password")
    get new_wagon_path
    assert_template 'wagons/new'
    name_of_wagon = "teeuws"
    description_of_wagon = "Dog Style"
    assert_difference 'Wagon.count', 1 do
      post wagons_path, params: { wagon: { name: name_of_wagon, description: description_of_wagon} }
    end
    follow_redirect!
    assert_match name_of_wagon.capitalize, response.body
    assert_match description_of_wagon, response.body
  end
  
  test "rejects invalid wagon submissions" do
    sign_in_as(@corsogroup, "password")
    get new_wagon_path
    assert_template 'wagons/new'
    assert_no_difference 'Wagon.count' do
      post wagons_path, params: { wagon: { name: " ", description: " "} }
    end
    assert_template 'wagons/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  # test "the truth" do
  #   assert true
  # end
end
