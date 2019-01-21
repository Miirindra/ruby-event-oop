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

	# constructeur surcharger
	def initialize(_start_date)
		@start_date = Time.parse(_start_date)
	end
	
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

	# savoir si un événement est à venir 
	def is_future?
		!is_past?
	end
end

event1 = Event.new("2019-06-07 12:00")
puts event1.is_past? # => false
puts event1.is_future? # => true



