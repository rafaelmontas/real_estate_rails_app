ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Returns true if a test user is logged in.
  def user_is_logged_in?
    !session[:user_id].nil?
  end

  # Returns true if a test agent is logged in.
  def is_logged_in?
    !session[:agent_id].nil?
  end

  # Log in as a particular agent.
  def log_in_as(agent)
    session[:agent_id] = agent.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular agent.
  def log_in_as(agent, password: 'password', remember_me: '1')
    post agents_login_path, params: { session: { email: agent.email,
                                                 password: password,
                                                 remember_me: remember_me } }
  end
end
