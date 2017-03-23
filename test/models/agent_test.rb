require 'test_helper'

class AgentTest < ActiveSupport::TestCase

  def setup
    @agent = Agent.new(name: "Rafael", email: "rafaelmontas1@gmail.com",
                                       phone_number: "8096483530",
                                       alt_phone_number: "8099080343",
                                       password: "password",
                                       password_confirmation: "password")
  end

  # test "should be valid" do
  #   assert @agent.valid?
  # end

  test "name should be present" do
    @agent.name = "   "
    assert_not @agent.valid?
  end

  test "email should be present" do
    @agent.email = "   "
    assert_not @agent.valid?
  end

  test "phone number should be present" do
    @agent.phone_number = "   "
    assert_not @agent.valid?
  end

  test "name should not be too long" do
    @agent.name = "a" * 51
    assert_not @agent.valid?
  end

  test "email should not be too long" do
    @agent.email = "a" * 244 + "@example.com"
    assert_not @agent.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @agent.email = valid_address
      assert @agent.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @agent.email = invalid_address
      assert_not @agent.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_agent = @agent.dup
    duplicate_agent.email = @agent.email.upcase
    @agent.save
    assert_not duplicate_agent.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @agent.email = mixed_case_email
    @agent.save
    assert_equal mixed_case_email.downcase, @agent.reload.email
  end

  test "password should be present (nonblank)" do
    @agent.password = @agent.password_confirmation = " " * 6
    assert_not @agent.valid?
  end

  test "password should have a minimum length" do
    @agent.password = @agent.password_confirmation = "a" * 5
    assert_not @agent.valid?
  end
end
