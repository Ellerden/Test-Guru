class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      MessageMailer.feedback(@message).deliver_now
      redirect_to new_message_url, notice: t('.success')
    else
      render :new, alert: t('.fail')
    end
  end

  private

  def message_params
    params.require(:message).permit(:author_name, :author_email, :body)
  end
end
