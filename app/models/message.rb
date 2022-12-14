# frozen_string_literal: true
class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user
  after_create_commit {broadcast_append_to "messages"}
  validates_presence_of :body
end