require "open-uri"

#### URL avatar
guilhem = URI.open("https://avatars.githubusercontent.com/u/102871325?v=4")
alex = URI.open("https://avatars.githubusercontent.com/u/101417151?v=4")
rayane = URI.open("https://avatars.githubusercontent.com/u/95938506?v=4")
patrick = URI.open("https://avatars.githubusercontent.com/u/102688364?v=4")

#### URL events
billet1 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet2 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet3 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet4 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet5 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet6 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet7 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")
billet8 = URI.open("https://doc.mint-energie.com/MintEnergie/MINT_ENERGIE_Fiche_Tarifs_1700_ONLINE_GREEN.pdf")

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
event_guilhem_01 = Event.new({ title: "TGV Marseille Paris", venue: "Gare Saint-Charles", starts_at: DateTime.new(2022, 06, 05, 11, 30), address: "Avenue Pierre Semard, 13001 Marseille", latitude: "43.3029782", longitude: "5.3845614", category: "Voyage", identity_card: "Y", driver_card: "N", passport: "Y", user: user_guilhem })
event_guilhem_01.document.attach(io: billet1, filename: "TGV1")
event_guilhem_01.save!
event_guilhem_02 = Event.new({ title: "Match PSG OM", venue: "Parc des princes", starts_at: DateTime.new(2022, 06, 05, 20, 30), address: "24 Rue du Commandant Guilbaud, 75016 Paris", latitude: "48.840248107910156", longitude: "2.2515957355499268", category: "Sport", identity_card: "Y", driver_card: "N", passport: "Y", user: user_guilhem })
event_guilhem_02.document.attach(io: billet2, filename: "PSG_OM")
event_guilhem_02.save!
event_guilhem_03 = Event.new({ title: "TGV Paris Marseille", venue: "Gare de Lyon", starts_at: DateTime.new(2022, 06, 06, 10, 00), address: "Place Louis-Armand, 75012 Paris", latitude: "48.8451154", longitude: "2.3730357", category: "Voyage", identity_card: "Y", driver_card: "N", passport: "Y", user: user_guilhem })
event_guilhem_03.document.attach(io: billet3, filename: "TGV2")
event_guilhem_03.save!

#### alex event creation
event_alex_01 = Event.new({ title: "Salon du Bourget", venue: "Aeroport du Bourget", starts_at: DateTime.new(2022, 06, 20, 10, 00), address: "24 Rue du Commandant Guilbaud, 75016 Paris", latitude: "48.840248107910156", longitude: "2.2515957355499268", category: "Autres", identity_card: "Y", driver_card: "N", passport: "Y", user: user_alex })
event_alex_01.document.attach(io: billet4, filename: "bourget")
event_alex_01.save!

#### rayane event creation
event_rayane_01 = Event.new({ title: "Demo day", venue: "Le Wagon", starts_at: DateTime.new(2022, 06, 03, 17, 00), address: "16 Vla Gaudelet, 75011 Paris", latitude: "48.8648601", longitude: "2.3798866", category: "Autres", identity_card: "Y", driver_card: "N", passport: "Y", user: user_rayane })
event_rayane_01.document.attach(io: billet5, filename: "demo_day_1")
event_rayane_01.save!
event_rayane_02 = Event.new({ title: "Demo day", venue: "Le Wagon", starts_at: DateTime.new(2022, 06, 8, 17, 00), address: "16 Vla Gaudelet, 75011 Paris", latitude: "48.8648601", longitude: "2.3798866", category: "Autres", identity_card: "Y", driver_card: "N", passport: "Y", user: user_rayane })
event_rayane_02.document.attach(io: billet6, filename: "demo_day_2")
event_rayane_02.save!
event_rayane_03 = Event.new({ title: "Demo day", venue: "Le Wagon", starts_at: DateTime.new(2022, 06, 10, 17, 00), address: "16 Vla Gaudelet, 75011 Paris", latitude: "48.8648601", longitude: "2.3798866", category: "Autres", identity_card: "Y", driver_card: "N", passport: "Y", user: user_rayane })
event_rayane_03.document.attach(io: billet7, filename: "demo_day_3")
event_rayane_03.save!

#### patrick event creation
event_patrick_01 = Event.new({ title: "Musee du Louvre", venue: "Musee du Louvre", starts_at: DateTime.new(2022, 06, 02, 10, 00), address: "Rue de Rivoli, 75001 Paris", latitude: "48.8607826", longitude: "2.3413157", category: "Culture", identity_card: "Y", driver_card: "N", passport: "Y", user: user_patrick })
event_patrick_01.document.attach(io: billet8, filename: "louvre")
event_patrick_01.save!
