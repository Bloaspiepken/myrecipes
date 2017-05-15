require 'test_helper'

class CorsogroupTest < ActiveSupport::TestCase
  
  def setup
    @corsogroup = Corsogroup.new(corsoname: "philip", email: "philip@example.com",
                          password: "password", password_confirmation: "password")                          
  end
  
  test "should be valid" do
    assert @corsogroup.valid?
  end
  
  test "name should be present" do
    @corsogroup.corsoname = " "
    assert_not @corsogroup.valid?
  end
  
  test "name should be less than 30 characters" do
    @corsogroup.corsoname = "a" * 31
    assert_not @corsogroup.valid?
  end
  
  test "email should be present" do
    @corsogroup.email = " "
    assert_not @corsogroup.valid?
  end
  
  test "email should not be too long" do
    @corsogroup.email = "a" * 245 + "@example.com"
    assert_not @corsogroup.valid?
  end
  
  test "email should accept correct format" do
    valid_emails = %w[user@example.com PHILIP@gmail.com P.first@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @corsogroup.email = valids
      assert @corsogroup.valid?, "#{valids.inspect} should be valid"
  end
 end 
 
  test "should reject invalid adresses" do
    invalid_emails = %w[philip@example philip@example,com philip.name@gmail. joe@bar+foo.com]
    invalid_emails.each do |invalids|
      @corsogroup.email = invalids
      assert_not @corsogroup.valid?,  "#{invalids.inspect} should be invalid"
  end     
 end
 
  test "email should be unique and case insensitive" do
    duplicate_corsogroup = @corsogroup.dup
    duplicate_corsogroup.email = @corsogroup.email.upcase
    @corsogroup.save
    assert_not duplicate_corsogroup.valid?
  end
  
  test "email should be lower case before hitting db" do
    mixed_email = "JohN@Example.com"
    @corsogroup.email = mixed_email
    @corsogroup.save
    assert_equal mixed_email.downcase, @corsogroup.reload.email
  end
  
  test "password should be present" do
    @corsogroup.password = @corsogroup.password_confirmation = " "
    assert_not @corsogroup.valid?
  end
  
  test "password should be atleast 5 characters"  do
    @corsogroup.password = @corsogroup.password_confirmation = "x" * 4
    assert_not @corsogroup.valid?
  end
  
  test "associated floats should be destroyed" do
    @corsogroup.save
    @corsogroup.wagons.create!(name: "testing destroy", description: "testing destroy function")
    assert_difference 'Wagon.count', -1 do
      @corsogroup.destroy
    end
  end
 
end