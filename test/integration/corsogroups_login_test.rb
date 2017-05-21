require 'test_helper'

class CorsogroupsLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com", password: "password")
  end
 
 test "invalid login is rejected" do
   get login_path
   assert_template 'sessions/new'
   post login_path, params: { session: { email: " ", password: " " } }
   assert_template 'sessions/new'
   assert_not flash.empty?
   assert_select "a[href=?]", login_path
   assert_select "a[href=?]", logout_path, count: 0
   get root_path
   assert flash.empty?
 end
 
 test "valid login credentials accepted and begin session" do
   get login_path
   assert_template 'sessions/new'
   post login_path, params: { session: { email: @corsogroup.email, password: @corsogroup.password } }
   assert_redirected_to @corsogroup
   follow_redirect!
   assert_template 'corsogroups/show'
   assert_not flash.empty?
   assert_select "a[href=?]", login_path,  count: 0
   assert_select "a[href=?]", logout_path
   assert_select "a[href=?]", corsogroup_path(@corsogroup)
   assert_select "a[href=?]", edit_corsogroup_path(@corsogroup)
 end
end
