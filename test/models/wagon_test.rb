require 'test_helper'

class WagonTest < ActiveSupport::TestCase
  
  def setup
    @wagon = Wagon.new(name: "kwintet", description: "Dwaallicht")
  end
  
  test "wagon should be valid" do
    assert @wagon.valid?
  end
  
  test "name should be valid" do
    @wagon.name = " "
    assert_not @wagon.valid?
  end
  
    test "description should be present" do
    @wagon.description = " "
    assert_not @wagon.valid?
  end
  
  test "description should not be less than 5 characters" do
    @wagon.description = "a" * 3
    assert_not @wagon.valid?
  end
  
  test "description should not be moer than 500 characters" do
    @wagon.description = "a" * 501
    assert_not @wagon.valid?
  end
  
end