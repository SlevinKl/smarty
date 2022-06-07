require "open-uri"

#### URL avatar
guilhem = URI.open("https://avatars.githubusercontent.com/u/102871325?v=4")
alex = URI.open("https://drive.google.com/file/d/1ir-FFcDCO8PbTJDffybEEmEymq62yTww/view?usp=sharing")
rayane = URI.open("https://drive.google.com/file/d/1ZuddiOl9Hadn0TDFMaVHIhuETZVkS5gN/view?usp=sharing")
patrick = URI.open("https://drive.google.com/file/d/1PYCGzBBCtH4GJwKMYmoRO73gH4SprLZl/view?usp=sharing")

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
billet10 = File.open("db/billets/batchparty.pdf")
billet11 = File.open("db/billets/concert.pdf")
billet12 = File.open("db/billets/demoday.pdf")
billet13 = File.open("db/billets/stationf.pdf")
billet14 = File.open("db/billets/theatre.pdf")


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
event_patrick_01 = Event.new({ title: "Vol Paris-Madrid", venue: "Aéroport CDG", starts_at: DateTime.new(2022, 05, 04, 13, 30), address: "6 rue des bruyères, 95700 Roissy-en-France", latitude: "49.008377", longitude: "2.545507", category: "Voyage", user: user_patrick, status: "after_ocr" })
event_patrick_01.document.attach(io: billet1, filename: "DEMO")
event_patrick_01.save!
event_patrick_02 = Event.new({ title: "Aquarium Tropical", venue: "Palais de la Porte Dorée", starts_at: DateTime.new(2022, 05, 10, 16, 00), address: "293 avenue Daumesnil, 75012 Paris", latitude: "48.8351424", longitude: "2.4093613", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_02.document.attach(io: billet2, filename: "OPEN")
event_patrick_02.save!
event_patrick_03 = Event.new({ title: "Séjour au Parc Astérix", venue: "Parc Astérix", starts_at: DateTime.new(2022, 05, 15, 11, 00), address: "Parc Astérix, 60128 Plailly", latitude: "49.1329246", longitude: "2.5718844", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_03.document.attach(io: billet3, filename: "KARAOKE")
event_patrick_03.save!
event_patrick_04 = Event.new({ title: "Train Paris-La Baule", venue: "Gare Paris Montparnasse", starts_at: DateTime.new(2022, 05, 25, 12, 00), address: "17 Bd de Vaugirard, 75015 Paris", latitude: "48.8414513", longitude: "2.3190734", category: "Voyage", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_04.document.attach(io: billet4, filename: "OPERA1")
event_patrick_04.save!
event_patrick_05 = Event.new({ title: "Finale Liverpool-Réal", venue: "Stade de France", starts_at: DateTime.new(2022, 05, 28, 21, 00) , address: "Rue Francis de Pressense, 93200 Saint-Denis", latitude: "48.9217022", longitude: "2.3667145", category: "Sport", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_05.document.attach(io: billet5, filename: "ROLAND")
event_patrick_05.save!
event_patrick_06 = Event.new({ title: "Demi-Finale Nadal-Zverev", venue: "Roland Garros", starts_at: DateTime.new(2022, 06, 03, 15, 00), address: "2 Avenue Gordon Bennett, 75016 Paris", latitude: "48.8470357", longitude: "2.2510931", category: "Sport", passport: true, user: user_patrick, status: "after_ocr" })
event_patrick_06.document.attach(io: billet6, filename: "CDGJFK")
event_patrick_06.save!
event_patrick_07 = Event.new({ title: "Le Lac des Cygnes", venue: "Opéra de Paris", starts_at: DateTime.new(2022, 06, 04, 20, 00), address: "Place de l'Opéra de Paris, 75009 Paris", latitude: "48.8710338", longitude: "2.3324", category: "Culture", passport: true, user: user_patrick, status: "after_ocr" })
event_patrick_07.document.attach(io: billet7, filename: "JFKLAX")
event_patrick_07.save!
event_patrick_08 = Event.new({ title: "Finale Nadal-Ruud", venue: "Roland Garros", starts_at: DateTime.new(2022, 06, 05, 15, 00), address: "2 Avenue Gordon Bennett, 75016 Paris", latitude: "48.8470357", longitude: "2.2510931", category: "Sport", passport: true, user: user_patrick, status: "after_ocr" })
event_patrick_08.document.attach(io: billet8, filename: "LAXCDG")
event_patrick_08.save!
event_patrick_09 = Event.new({ title: "Démo Day", venue: "Le Wagon", starts_at: DateTime.new(2022, 06, 10, 17, 00), address: "16 Villa Gaudelet, 75011 Paris", latitude: "48.8648601", longitude: "2.3798866", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_09.document.attach(io: billet12, filename: "demoday")
event_patrick_09.save!
event_patrick_10 = Event.new({ title: "Concert Elton John", venue: "Paris La Défense Arena", starts_at: DateTime.new(2022, 06, 14, 20, 00), address: "99 Jardins de l'Arche, 92000 Nanterre", latitude: "48.892", longitude: "2.2067", category: "Culture", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_10.document.attach(io: billet11, filename: "concert")
event_patrick_10.save!
event_patrick_11 = Event.new({ title: "Le Roi Lion", venue: "Théâtre Mogador", starts_at: DateTime.new(2022, 06, 11, 20, 00), address: "25 rue Mogador, 75009 Paris", latitude: "48.8753635", longitude: "2.3312348", category: "Culture", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_11.document.attach(io: billet14, filename: "theatre")
event_patrick_11.save!
event_patrick_12 = Event.new({ title: "Parcours d'accrobranche", venue: "Accrocamp Saint-Germain en Laye", starts_at: DateTime.new(2022, 06, 19, 13, 00), address: "48 Parc Forestier de la Charmeraie, 78100 Saint-Germain-en-Laye", latitude: "48.9", longitude: "2.08333", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_12.save!
event_patrick_13 = Event.new({ title: "Festival Solidays", venue: "Hippodrome de Longchamp", starts_at: DateTime.new(2022, 06, 25, 14, 00), address: "2 route des Tribunes, 75016 Paris", latitude: "48.8566061", longitude: "2.23348", category: "Culture", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_13.save!
event_patrick_14 = Event.new({ title: "Exposition: Les 20 ans de l'Euro", venue: "Musée d'Orsay", starts_at: DateTime.new(2022, 06, 29, 19, 00), address: "2 rue Guénégaud, 75006 Paris", latitude: "48.8563147", longitude: "2.3394806", category: "Culture", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_14.save!
event_patrick_15 = Event.new({ title: "Exposition Picasso à l'image", venue: "Musée Picasso Paris", starts_at: DateTime.new(2022, 07, 02, 14, 00), address: "5 rue de Thorigny, 75003 Paris", latitude: "48.8598698", longitude: "2.3621152", category: "Culture", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_15.save!
event_patrick_16 = Event.new({ title: "Flyview : expérience de VR", venue: "Flyview Paris", starts_at: DateTime.new(2022, 07, 10, 10, 00), address: "30 rue du 4 Septembre, 75002 Paris", latitude: "48.8702799", longitude: "2.3333442", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_16.save!
event_patrick_17 = Event.new({ title: "La nuit aux Invalides", venue: "Esplanade des Invalides", starts_at: DateTime.new(2022, 07, 16, 22, 30), address: "129 Rue de Grenelle, 75007 Paris", latitude: "48.8570374", longitude: "2.3118779", category: "Culture", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_17.save!
event_patrick_18 = Event.new({ title: "Vol Paris-Los Angeles", venue: "Aéroport Orly", starts_at: DateTime.new(2022, 07, 18, 14, 50), address: "103 Aérogare Sud, 94390 Orly", latitude: "48.714", longitude: "2.3628", category: "Voyage", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_18.document.attach(io: billet9, filename: "OPERA2")
event_patrick_18.save!
event_patrick_19 = Event.new({ title: "Batch Party Le Wagon", venue: "La Rotonde", starts_at: DateTime.new(2022, 06, 10, 20, 00), address: "6 Place de la Bataille de Stalingrad, 75019 Paris", latitude: "48.8835848", longitude: "2.3695698", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_19.document.attach(io: billet10, filename: "batchparty")
event_patrick_19.save!
event_patrick_20 = Event.new({ title: "Fighters Day", venue: "Station F", starts_at: DateTime.new(2022, 06, 11, 10, 00), address: "55 boulevard Vincent Auriol, 75013 Paris", latitude: "48.8347726", longitude: "2.3701218", category: "Autres", identity_card: true, user: user_patrick, status: "after_ocr" })
event_patrick_20.document.attach(io: billet13, filename: "stationf")
event_patrick_20.save!
