require 'test_helper'

class AgentMailerTest < ActionMailer::TestCase

  test "account_activation" do
    agent = agents(:rafael)
    agent.activation_token = Agent.new_token
    mail = AgentMailer.account_activation(agent)
    assert_equal "Activación de Cuenta", mail.subject
    assert_equal [agent.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match agent.name, mail.body.encoded
    assert_match agent.activation_token, mail.body.encoded
    assert_match CGI.escape(agent.email), mail.body.encoded
  end



end
