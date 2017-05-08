require 'test_helper'

class CorsogroupsShowTest < ActionDispatch::IntegrationTest

    def setup
      @corsogroup = Corsogroup.create!(corsoname: "philip", email: "philip@example.com",
                                password: "password", password_confirmation: "password")
      @wagon = Wagon.create(name: "philip", description: "Dwaallicht", corsogroup: @corsogroup)
      @wagon2 = @corsogroup.wagons.build(name: "philip", description: "Honden")
      @wagon2.save
    end
    
    test "should get corsogroups show" do
      get corsogroup_path(@corsogroup)
      assert_template 'corsogroups/show'
      assert_select "a[href=?]", wagon_path(@wagon), text: @wagon.name
      assert_select "a[href=?]", wagon_path(@wagon2), text: @wagon.name
      assert_match @wagon.description, response.body
      assert_match @wagon2.description, response.body
      assert_match @corsogroup.corsoname, response.body
    end
  

end
