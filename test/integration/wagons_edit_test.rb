require 'test_helper'

class WagonsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com",
                              password: "password", password_confirmation: "password")
    @wagon = Wagon.create(name: "philip", description: "Dwaallicht", corsogroup: @corsogroup)
  end
   
  test "reject invalid wagon update" do
    get edit_wagon_path(@wagon)
    assert_template 'wagons/edit'
    patch wagon_path(@wagon), params: { wagon: { name: " ", description: "some description" } }
    assert_template 'wagons/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "successfully edit a wagon" do
    get edit_wagon_path(@wagon)
    assert_template 'wagons/edit'
    updated_name = "updated float name"
    updated_description = "updated float description"
    patch wagon_path(@wagon), params: { wagon: { name: updated_name, description: updated_description } }
    assert_redirected_to @wagon
    #follow_redirect!
    assert_not flash.empty?
    @wagon.reload
    assert_match updated_name, @wagon.name
    assert_match updated_description, @wagon.description
  end
end
