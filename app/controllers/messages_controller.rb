#frozen_string_literal: true
class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  #for viewing the conversation messages of an user
  def index
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  # for creating new messages
  def new
    @message = @conversation.messages.new
  end

  #redirecting the messages if saved to conversation_messages_path
  def create
    @message = @conversation.messages.new(message_params)
    if @message.save!
      redirect_to conversation_messages_path(@conversation)
    end
  end

  #permitting the required fields
  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
