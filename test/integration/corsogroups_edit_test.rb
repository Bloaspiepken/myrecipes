require 'test_helper'

class CorsogroupsEditTest < ActionDispatch::IntegrationTest
  
  def setup
        @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com",
                              password: "password", password_confirmation: "password")
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
  
  test "accept valid sign up" do
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
  # test "the truth" do
  #   assert true
  # end
end
