class User
	attr_accessor :email, :name

	@@array = Array.new

	def initialize(email_to_save)
		@email = email_to_save
		@@array << @email
	end
end

user1 = User.new("email@email.com")
