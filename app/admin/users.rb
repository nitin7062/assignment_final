ActiveAdmin.register User do
  permit_params :first_name, :last_name, :mobile_number, :address, :state, :pin_code, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :role, :admin
end
