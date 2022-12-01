# frozen_string_literal: true
class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # to view all conversations
  def index
    @conversations = Conversation.all
  end

  # checks if the conversation exist or not if not it creates an conversation.
  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
  end

  private
  #for permitting the required fields
  def conversation_params
    params.permit(:sender_id, :receiver_id)
  end
end