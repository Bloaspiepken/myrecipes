require 'test_helper'

class WagonsDeleteTest < ActionDispatch::IntegrationTest
  def setup
    @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com")
    @wagon = Wagon.create(name: "philip", description: "Dwaallicht", corsogroup: @corsogroup)
  end
  
  test "successfully delete a float" do
    get wagon_path(@wagon)
    assert_template 'wagons/show'
    assert_select 'a[href=?]', wagon_path(@wagon), text: "Delete this float"
    assert_difference 'Wagon.count', -1 do
      delete wagon_path(@wagon)
    end
    assert_redirected_to wagons_path
    assert_not flash.empty?
  end
end
