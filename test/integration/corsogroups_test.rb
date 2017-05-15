require 'test_helper'

class CorsogroupsTest < ActionDispatch::IntegrationTest
  
  def setup
    @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com",
                              password: "password", password_confirmation: "password")
    @corsogroup2 = Corsogroup.create!(corsoname: "john", email: "john@example.com",
                              password: "password", password_confirmation: "password")
  end
  
    test "should get corsogroups listing" do
    get corsogroups_path
    assert_template 'corsogroups/index'
    assert_select "a[href=?]", corsogroup_path(@corsogroup), text: @corsogroup.corsoname.capitalize
    assert_select "a[href=?]", corsogroup_path(@corsogroup2), text: @corsogroup2.corsoname.capitalize
  end
  
  # test "the truth" do
  #   assert true
  # end
end
