namespace :user do
  desc "Create a user"
  task :create, [:email, :password] => :environment do |task, args|
    email = args[:email]
    password = args[:password]

    if email.blank? || password.blank?
      puts "--------> please provide both email and password!" and exit
    end

    user = User.create( email: email,
                        password: password,
                        password_confirmation: password )

    puts "Error: #{user.errors.full_messages.join("\n")}" unless user.valid?
    end
end