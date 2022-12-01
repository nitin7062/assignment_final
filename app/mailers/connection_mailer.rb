class ConnectionMailer < ApplicationMailer
  #for finding user and friend and sending message "hi"
  def connection_created
    @user = params[:user]
    @friend = params[:friend]
    @greeting = "Hi"
    mail to: @friend.email, subject: "connection requested"
  end
end
