# frozen_string_literal: true

class MessageMailer < ApplicationMailer
  def feedback(message)
    @author = message.author_name
    @author_email = message.author_email
    @text = message.body
    mail to: Admin.first.email
  end
end
