User.seed do |u|
  u.id = 1
  u.email = 'admin@connect.com'
  u.encrypted_password = '$2a$10$zWBcKs0pMgYUG/RQkLndwuj1OaSQWDX4gi4Fu0ug6.fRwuxeS7Vai' # admin123
  u.sign_in_count = 1
  u.current_sign_in_at = Time.now
  u.last_sign_in_at = Time.now
  u.current_sign_in_ip = '127.0.0.1'
  u.last_sign_in_ip = '127.0.0.1'
  u.created_at = Time.now
  u.updated_at = Time.now
end
