# frozen_string_literal: true
class Message < ActiveRecord::Base
  belongs_to :conversation

  validates_presence_of :body
end