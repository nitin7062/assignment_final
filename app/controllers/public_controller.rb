# frozen_string_literal: true
class PublicController < ApplicationController
  # for redirecting to users_path if it is current user
  def main
    if current_user
      redirect_to users_path
    end
  end
end
