require 'test_helper'

class AgentsSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get agents_signup_path
    assert_select 'form[action="/agents/signup"]'
    assert_no_difference 'Agent.count' do
      post agents_signup_path, params: { agent: { name: " ",
                                           email: "agent@invalid",
                                           phone_number: " ",
                                           alt_phone_number: " ",
                                           password: "foo",
                                           password_confirmation: "foo" } }
    end
    assert_template "agents/new"
    assert_select "div#error_explanation"
    assert_select "div.field_with_errors"
  end

  test "valid signup information" do
    get agents_signup_path
    assert_difference "Agent.count", 1 do
      post agents_signup_path, params: { agent: { name: "Rafael",
                                                  email: "valid@gmail.com",
                                                  phone_number: "80900000",
                                                  alt_phone_number: "8090000",
                                                  password: "foobar",
                                                  password_confirmation: "foobar" } }
    end
    follow_redirect!
    assert_template "agents/show"
    assert_not flash.empty?
  end
end
