class AgentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agent_mailer.account_activation.subject
  #
  def account_activation(agent)
    @agent =  agent
    mail to: agent.email, subject: "Activación de Cuenta"
    mail.transport_encoding = "8bit"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.agent_mailer.password_reset.subject
  #
  def password_reset(agent)
    @agent = agent
    mail to: agent.email, subject: "Cambio de Contraseña"
    mail.transport_encoding = "8bit"
  end
end
