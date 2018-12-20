class MessageMailer < ApplicationMailer
  def feedback(message)
    @author = message.author_name
    @author_email = message.author_email
    @text = message.body
    mail to: ENV['FEEDBACK_EMAIL']
  end
end