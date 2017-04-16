require 'test_helper'

class WagonsTest < ActionDispatch::IntegrationTest
  
  def setup
    @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com")
    @wagon = Wagon.create(name: "kwintet", description: "Dwaallicht", corsogroup: @corsogroup)
    @wagon2 = @corsogroup.wagons.build(name: "Teeuws", description: "Honden")
    @wagon2.save
  end
  
  
  
  test "should get wagons index" do
    get wagons_path
    assert_response :success
  end
  
  test "should get wagons listing" do
    get wagons_path
    assert_template 'wagons/index'
    assert_match @wagon.name, response.body
    assert_match @wagon2.name, response.body
  end
  # test "the truth" do
  #   assert true
  # end
end
