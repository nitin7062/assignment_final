class PublicController < ApplicationController
  def main
    if current_user
      redirect_to users_path
    end
  end
  def help
  end
  def about
  end
end
