require 'test_helper'

class CorsogroupsEditTest < ActionDispatch::IntegrationTest
  
  def setup
        @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com",
                              password: "password", password_confirmation: "password")
        @corsogroup2 = Corsogroup.create!(corsoname: "john", email: "john@example.com",
                              password: "password", password_confirmation: "password")
        @admin_user = Corsogroup.create!(corsoname: "john1", email: "john1@example.com",
                              password: "password", password_confirmation: "password", admin: true)
  end  

  test "reject an invalid edit" do
    sign_in_as(@corsogroup, "password")
    get edit_corsogroup_path(@corsogroup)
    assert_template 'corsogroups/edit'
    patch corsogroup_path(@corsogroup), params: { corsogroup: { corsoname: " ", email: "philip@example.com" } }
    assert_template 'corsogroups/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid edit" do
    sign_in_as(@corsogroup, "password")
    get edit_corsogroup_path(@corsogroup)
    assert_template 'corsogroups/edit'
    patch corsogroup_path(@corsogroup), params: { corsogroup: { corsoname: "philip1", email: "philip1@example.com" } }
    assert_redirected_to @corsogroup
    assert_not flash.empty?
    @corsogroup.reload
    assert_match "philip1", @corsogroup.corsoname
    assert_match "philip1@example.com", @corsogroup.email
  end
  
  test "accept edit attempt by admin user" do
    sign_in_as(@admin_user, "password")
    get edit_corsogroup_path(@corsogroup)
    assert_template 'corsogroups/edit'
    patch corsogroup_path(@corsogroup), params: { corsogroup: { corsoname: "philip3", email: "philip3@example.com" } }
    assert_redirected_to @corsogroup
    assert_not flash.empty?
    @corsogroup.reload
    assert_match "philip3", @corsogroup.corsoname
    assert_match "philip3@example.com", @corsogroup.email
  end
  
  test "redirect edit attempt by another non-admin user" do
    sign_in_as(@corsogroup2, "password")
    updated_name = "joe"
    updated_email = "joe@example.com"
    patch corsogroup_path(@corsogroup), params: { corsogroup: { corsoname: updated_name, email: updated_email } }
    assert_redirected_to corsogroups_path
    assert_not flash.empty?
    @corsogroup.reload
    assert_match "philip", @corsogroup.corsoname
    assert_match "philip@example.com", @corsogroup.email
  end
  # test "the truth" do
  #   assert true
  # end
end
