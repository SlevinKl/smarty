require "open-uri"

#### URL avatar
guilhem = URI.open("https://avatars.githubusercontent.com/u/102871325?v=4")
alex = URI.open("https://avatars.githubusercontent.com/u/101417151?v=4")
rayane = URI.open("https://avatars.githubusercontent.com/u/95938506?v=4")
patrick = URI.open("https://avatars.githubusercontent.com/u/102688364?v=4")

#### URL events
billet1 = URI.open("https://drive.google.com/file/d/1ZMH6YpFqN8ANQOCnwtpEh9FVET0QxqpG/view?usp=sharing")
billet2 = URI.open("https://drive.google.com/file/d/1N3MzaRqDL1RaCiPxi0NK7Dhc5Rn_wOCM/view?usp=sharing")
billet3 = URI.open("https://drive.google.com/file/d/1AOi5pCowHccmWqylYCCusGZAUmGUlPdZ/view?usp=sharing")
billet4 = URI.open("https://drive.google.com/file/d/166bVB9CmcYx0BiGw65Uj0ks1dpU-G8Vq/view?usp=sharing")
billet5 = URI.open("https://drive.google.com/file/d/18IzLJQ79bgpBiYI2IzYvNOt6gOALyPXY/view?usp=sharing")
billet6 = URI.open("https://drive.google.com/file/d/14ybD5WOWfRaa-d4xaxJst_BLLtDjSej6/view?usp=sharing")
billet7 = URI.open("https://drive.google.com/file/d/1vObQ5kqbh3TvTWImkXnc3z4mGwKKFRDZ/view?usp=sharing")
billet8 = URI.open("https://drive.google.com/file/d/1wGkBpNWs6SSabTUQmi07sip6ZDPogB-U/view?usp=sharing")
billet9 = URI.open("https://drive.google.com/file/d/11T7MXsZ7T7JenxR4JvTR7uZHhTzKIKza/view?usp=sharing")

#### clean the database
Event.destroy_all
User.destroy_all

#### user creation
user_guilhem = User.new(email: "guilhem@lewagon.fr", password: "azerty", first_name: "Guilhem", last_name: "Lewagon", phone: "+33612345678" )
user_guilhem.avatar.attach(io: guilhem, filename: "guilhem")
user_guilhem.save!

user_alex = User.new(email: "alex@lewagon.fr", password: "azerty", first_name: "Alex", last_name: "Lewagon", phone: "+33612376578" )
user_alex.avatar.attach(io: alex, filename: "alex")
user_alex.save!

user_rayane = User.new(email: "rayane@lewagon.fr", password: "azerty", first_name: "Rayane", last_name: "Lewagon", phone: "+33618765678" )
user_rayane.avatar.attach(io: rayane, filename: "rayane")
user_rayane.save!

user_patrick = User.new(email: "patrick@lewagon.fr", password: "azerty", first_name: "Patrick", last_name: "Lewagon", phone: "+33612348351" )
user_patrick.avatar.attach(io: patrick, filename: "patrick")
user_patrick.save!

#### patrick event creation
event_patrick_01 = Event.new({ title: "Démo day", venue: "Le Wagon", starts_at: DateTime.new(2022, 06, 03, 17, 00), address: "16 Vla Gaudelet, 75011 Paris", latitude: "48.8648601", longitude: "2.3798866", category: "Autres", user: user_patrick })
event_patrick_01.document.attach(io: billet1, filename: "DEMO")
event_patrick_01.save!
event_patrick_02 = Event.new({ title: "Soirée open bar", venue: "Les Marquises", starts_at: DateTime.new(2022, 06, 03, 20, 00), address: "145 rue Oberkampf, 75011 Paris", latitude: "48.8667135", longitude: "2.3812373", category: "Autres", identity_card: true, user: user_patrick })
event_patrick_02.document.attach(io: billet2, filename: "OPEN")
event_patrick_02.save!
event_patrick_03 = Event.new({ title: "Nuit Karaoké", venue: "BAM Karaoké box Parmentier", starts_at: DateTime.new(2022, 06, 03, 23, 30), address: "40 avenue de la République, 75011 Paris", latitude: "48.8653737", longitude: "2.3732312", category: "Culture", identity_card: true, user: user_patrick })
event_patrick_03.document.attach(io: billet3, filename: "KARAOKE")
event_patrick_03.save!
event_patrick_04 = Event.new({ title: "Le lac des cygnes", venue: "Opéra de Paris", starts_at: DateTime.new(2022, 06, 04, 20, 00), address: "Place de l'Opéra, 75009 Paris", latitude: "48.87111282348633", longitude: "2.3321521282196045", category: "Culture", identity_card: true, user: user_patrick })
event_patrick_04.document.attach(io: billet4, filename: "OPERA1")
event_patrick_04.save!
event_patrick_05 = Event.new({ title: "Nadal - Djokovic", venue: "Roland-Garros", starts_at: DateTime.new(2022, 06, 05, 14, 00), address: "2 avenue Gordon Benett, 75016 Paris", latitude: "48.8637", longitude: "2.2769", category: "Sport", identity_card: true, user: user_patrick })
event_patrick_05.document.attach(io: billet5, filename: "ROLAND")
event_patrick_05.save!
event_patrick_06 = Event.new({ title: "Paris New-York", venue: "CDG", starts_at: DateTime.new(2022, 06, 06, 11, 00), address: "95700 Roissy-en-France", latitude: "49.0032865", longitude: "2.5176985", category: "Voyage", passport: true, user: user_patrick })
event_patrick_06.document.attach(io: billet6, filename: "CDGJFK")
event_patrick_06.save!
event_patrick_07 = Event.new({ title: "New-York Los Angeles", venue: "JFK", starts_at: DateTime.new(2022, 06, 12, 10, 00), address: "Comté de Queens, NY 11430, États-Unis", latitude: "40.6472", longitude: "-73.7827", category: "Voyage", passport: true, user: user_patrick })
event_patrick_07.document.attach(io: billet7, filename: "JFKLAX")
event_patrick_07.save!
event_patrick_08 = Event.new({ title: "Los Angeles Paris", venue: "LAX", starts_at: DateTime.new(2022, 06, 21, 10, 00), address: "1 World Way, Los Angeles, CA 90045, Etats-Unis", latitude: "33.943115234375", longitude: "-118.4021301269531", category: "Voyage", passport: true, user: user_patrick })
event_patrick_08.document.attach(io: billet8, filename: "LAXCDG")
event_patrick_08.save!
event_patrick_09 = Event.new({ title: "Faust", venue: "Opéra de Paris", starts_at: DateTime.new(2022, 06, 25, 20, 00), address: "Place de l'Opéra, 75009 Paris", latitude: "48.87111282348633", longitude: "2.3321521282196045", category: "Culture", identity_card: true, user: user_patrick })
event_patrick_09.document.attach(io: billet9, filename: "OPERA2")
event_patrick_09.save!
