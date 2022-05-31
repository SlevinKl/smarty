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

#### guilhem event creation
event_guilhem_01 = Event.new({ title: "DEMO DAY", venue: "LE WAGON", starts_at: DateTime.new(2022, 06, 03, 17, 00), address: "16 VLA GAUDELET, 75011 PARIS", latitude: "48.8648601", longitude: "2.3798866", category: "Culture", identity_card: true, user: user_guilhem })
event_guilhem_01.document.attach(io: billet1, filename: "TGV1")
event_guilhem_01.save!
event_guilhem_02 = Event.new({ title: "SOIREE OPEN BAR", venue: "LES MARQUISES", starts_at: DateTime.new(2022, 06, 03, 20, 00), address: "145 RUE OBERKAMPF, 75011 PARIS", latitude: "48.8667135", longitude: "2.3812373", category: "Autres", identity_card: true, user: user_guilhem })
event_guilhem_02.document.attach(io: billet2, filename: "PSG_OM")
event_guilhem_02.save!
event_guilhem_03 = Event.new({ title: "NUIT KARAOKE", venue: "BAM KARAOKE BOX PARMENTIER", starts_at: DateTime.new(2022, 06, 03, 23, 30), address: "40 AV. DE LA RÉPUBLIQUE, 75011 PARIS", latitude: "48.8653737", longitude: "2.3732312", category: "Culture", passport: true, user: user_guilhem })
event_guilhem_03.document.attach(io: billet3, filename: "TGV2")
event_guilhem_03.save!
