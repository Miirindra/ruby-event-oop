require 'time'

class Event
	
	attr_accessor :start_date, :length, :title, :attendees

	# constructeur
	def initialize(_start_date, _length, _title, _attendees)
		@start_date = Time.parse(_start_date)
		@length = _length.to_i
		@title = _title
		@attendees = _attendees
	end
	
	# def initialize(_start_date)
	# 	@start_date = Time.parse(_start_date)
	# end

	# Décaler d'événement en 24h
	def postpone_24h
		@start_date += 24 * 60 * 60 # 1j = 24h*60mn*60s
	end

	# retourner l'heure de fin d'un événement
	def end_date
		@start_date += @length * 60
	end

	# savoir si un événement est passé ou pas
	def is_past?
		@start_date < Time.now
	end

	# savoir si un événement est à venir  (dans le futur)
	def is_future?
		!self.is_past?
	end

	# savoir si un événement est bientôt. 
	# C’est-à-dire si sa start_date est dans moins de 30 minutes.
	def is_soon?
		(@start_date-Time.now)/60 <= 30
	end

	def to_s
		puts "Title: #{title}"
		puts "Date de début: #{start_date}"
		puts "Durée: #{length} minute(s)"
		puts "Invités: #{attendees.join(", ")}"
	end

	def self.find_by_email(email)
		self.new(email)
	end

	def mise_en_page
		puts "-" * 50
	end
end

# event1 = Event.new("2019-01-22 07:00", 10, "standup quotidien", ["julie", "jean"])
# event1 = Event.new("2019-01-22 07:50")
# event1.mise_en_page
# puts "past: #{event1.is_past?}" 
# puts "future: #{event1.is_future?}"
# puts "Now: #{Time.now}"
# puts "event: #{event1.start_date}"
# puts "moins de 30mn?: #{event1.is_soon?}"
# event1.mise_en_page
# puts event1.to_s

