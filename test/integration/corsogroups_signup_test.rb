require 'test_helper'

class CorsogroupsSignupTest < ActionDispatch::IntegrationTest
  
  test "should get signup path" do
    get signup_path
    assert_response :success
  end
  
  test "reject an invalid signup" do
    get signup_path
    assert_no_difference "Corsogroup.count" do
      post corsogroups_path, params: { corsogroup: { corsoname: " ", email: " ", password: "password",
                                                    password_confirmation: " " } }
    end
    assert_template 'corsogroups/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid sign up" do
    get signup_path
    assert_difference "Corsogroup.count", 1 do
      post corsogroups_path, params: { corsogroup: { corsoname: "philip", email: "philip@example.com", password: "password",
                                                    password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template'corsogroups/show'
    assert_not flash.empty?
  end
end
