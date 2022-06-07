class ExtractEventInfos
  def initialize(event)
    @event = event
  end

  def call
    # TODO:
    # - appeler l'ocr de cloudinary avec le document
    # - extraire les data via des regexps
    # - mettre a jour l'event avec les data

    # - appeler l'ocr de cloudinary avec le document
    public_id = "#{Rails.env}/#{@event.document.blob.key}"

    ocr = Cloudinary::Api.update(
      public_id,
      ocr: "adv_ocr:document"
    )

    # - extraire les data via des regexps
    description = ocr["info"]["ocr"]["adv_ocr:document"]["data"].first["textAnnotations"].first["description"]

    # backup si le text annotation c'est pas ca finalement
    # ocr["info"]["ocr"]["adv_ocr:document"]["data"][0]["fullTextAnnotation"]["text"]

    # DEBUG pour TESTER LES REGEXPS
    # dans un rails c :
    # description = "eventbrite\nTalk avec Nicolas Bacca, Co-founder de Ledger\nTalk avec Nicolas Bacca, Co-founder de Ledger\nLe Wagon Gaudelet, 16 villa gaudelet, 75011 Paris, France\nMercredi 18 mai 2022 de 19:00 à 20:30 (heure : France)\nCommande gratuite\nInformations de commande\nCommande N° 3482973199. Commandé par Rayane\nMOULA le 2 mai 2022 14:37\nCommande n° 3482973199\nwwwbCong\nNom\nRayane MOULA\n➡15 ml 115h-Mybride\nDicer le parcours de Nicolas\nBacca, Co-Founder de Ledger:\nLa come française de\nacurisation des\ncryptemonnaies\nReserve la place\n34829731995426966019001\nOrganisez-vous des événements?\nCommencez à vendre en quelques minutes\ngrâce à Eventbrite!\nwww.eventbrite.com"

    # TEST STATION F
    # description = "eventbrite\nFighters Day\nAdmission générale\nSTATION F, 55 Boulevard Vincent Auriol, 75013 Paris, France\nSamedi 11 juin 2022 de 10:00 à 19:00 (heure : France)\nCommande gratuite\nInformations de commande\nCommande N° 3786441029. Commandé par Guilhem\nHidalgo le 6 juin 2022 10:22\nCommande n° 3786441029\nSTATION P\nSINGA\nFIGHTERS DAY\n11 juin 2022-STATION F\nO\n37864410295998153399001\nOrganisez-vous des événements?\nCommencez à vendre en quelques minutes\ngrâce à Eventbrite!\nwww.eventbrite.com"

    # ce regex  marche
     venue_n_address = description.match(/^((?<venue>[\p{L} ]+),\s)?(?<address>[0-9]+[\p{L}]*\s+[\p{L}]+(\s*[\p{L}]+)*,\s[0-9]+\s[\p{L}]+)/)

    # TEST DEMO DAY
    # description = "eventbrite\nDemo Day\nDemo day\nLe Wagon, 16 Villa Gaudelet, 75011 Paris, France\nVendredi 10 juin 2022 de 16:00 à 18:00 (heure : France)\nCommande gratuite\nInformations de commande\nCommande N° 3796326919. Commandé par Rayane\nMOULA le 7 juin 2022 12:20\nCommande n° 3796326919\n37963269196017012849001\nOrganisez-vous des événements?\nCommencez à vendre en quelques minutes\ngrâce à Eventbrite!\nwww.eventbrite.com"

<<<<<<< HEAD
    # venue_n_address = description.match(/^((?<venue>[a-zA-Z ]+),\s)?(?<address>[0-9]+[a-zA-Z]*\s+[a-zA-Z]+(\s*[a-zA-Z]+)*,\s[0-9]+\s[a-zA-Z]+)/)
=======
    if venue_n_address != nil
      venue   = venue_n_address[:venue]
      address = venue_n_address[:address]
>>>>>>> master

      # cas simple: le titre fait que une seule ligne (sweat smile...)
      # title = description.split("\n")[1]

      # explications pour les titres chiants :
      # 1. on prend le texte jusqu'à la venue :
      #    ex : eventbrite\nNFT, Metaverse: Qu'est-ce qui se cache derrière la\nhype?\nNFT, Metaverse : Qu'est-ce qui se cache derrière l\n
      # 2. on split sur le retour à la ligne \n
      #    ex : ["eventbrite", "NFT, Metaverse: Qu'est-ce qui se cache derrière la", "hype", "NFT, Metaverse : Qu'est-ce qui se cache derrière l"]
      # 3. on prend tous les elements du tableau SAUF le premier ET le dernier
      #    ex : ["NFT, Metaverse: Qu'est-ce qui se cache derrière la", "hype"]
      # 4. on rassemble les elements en mettant un espace entre eux
      #    ex : "NFT, Metaverse: Qu'est-ce qui se cache derrière la hype?"

      venue_index = description.index(venue)
      title = description[0...venue_index].split("\n")[1...-1].join(' ')

      # starts_at
      date = description.match(/([0-9]+\s[a-zA-Z]+\s[0-9]{4})/)[1]
      time = description.match(/([0-9]{2}:[0-9]{2})/)[1]

      day, french_month, year = date.split(' ')
      month_number = I18n.t('date.month_names').index(french_month)

      # format: 2022-5-18 19:00
      starts_at = "#{year}-#{month_number}-#{day} #{time}"

      # - mettre a jour l'event avec les data
      @event.update(
        title: title,
        venue: venue,
        address: address,
        starts_at: starts_at
      )
    end
  end
end
# a lancer dans un rails c pour tester :
# event = Event.last
# ExtractEventInfos.new(event).call
