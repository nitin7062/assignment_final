# Preview all emails at http://localhost:3000/rails/mailers/connection_mailer
class ConnectionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/connection_mailer/connection_created
  def connection_created
    ConnectionMailer.connection_created
  end

end
