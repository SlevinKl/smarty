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

    # ocr["info"]["ocr"]["adv_ocr:document"]["data"][0]["fullTextAnnotation"]["text"]

    # TESTER LES REGEXPS
    # dans un rails c :
    description = "eventbrite\nTalk avec Nicolas Bacca, Co-founder de Ledger\nTalk avec Nicolas Bacca, Co-founder de Ledger\nLe Wagon Gaudelet, 16 villa gaudelet, 75011 Paris, France\nMercredi 18 mai 2022 de 19:00 à 20:30 (heure : France)\nCommande gratuite\nInformations de commande\nCommande N° 3482973199. Commandé par Rayane\nMOULA le 2 mai 2022 14:37\nCommande n° 3482973199\nwwwbCong\nNom\nRayane MOULA\n➡15 ml 115h-Mybride\nDicer le parcours de Nicolas\nBacca, Co-Founder de Ledger:\nLa come française de\nacurisation des\ncryptemonnaies\nReserve la place\n34829731995426966019001\nOrganisez-vous des événements?\nCommencez à vendre en quelques minutes\ngrâce à Eventbrite!\nwww.eventbrite.com"



    # - mettre a jour l'event avec les data
  end
end

# a lancer dans un rails c pour tester :
# event = Event.last
# ExtractEventInfos.new(event).call
