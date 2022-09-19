//
//  CardData.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 7/22/22.
//updated
//

/**
 {"object":"card","id":"0000579f-7b35-4ed3-b44c-db2a538066fe","oracle_id":"44623693-51d6-49ad-8cd7-140505caf02f","multiverse_ids":[109722],"mtgo_id":25527,"mtgo_foil_id":25528,"tcgplayer_id":14240,"cardmarket_id":13850,"name":"Fury Sliver","lang":"en","released_at":"2006-10-06","uri":"https://api.scryfall.com/cards/0000579f-7b35-4ed3-b44c-db2a538066fe","scryfall_uri":"https://scryfall.com/card/tsp/157/fury-sliver?utm_source=api","layout":"normal","highres_image":true,"image_status":"highres_scan","image_uris":{"small":"https://c1.scryfall.com/file/scryfall-cards/small/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","normal":"https://c1.scryfall.com/file/scryfall-cards/normal/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","large":"https://c1.scryfall.com/file/scryfall-cards/large/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","png":"https://c1.scryfall.com/file/scryfall-cards/png/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.png?1562894979","art_crop":"https://c1.scryfall.com/file/scryfall-cards/art_crop/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","border_crop":"https://c1.scryfall.com/file/scryfall-cards/border_crop/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979"},"mana_cost":"{5}{R}","cmc":6.0,"type_line":"Creature — Sliver","oracle_text":"All Sliver creatures have double strike.","power":"3","toughness":"3","colors":["R"],"color_identity":["R"],"keywords":[],"legalities":{"standard":"not_legal","future":"not_legal","historic":"not_legal","gladiator":"not_legal","pioneer":"not_legal","explorer":"not_legal","modern":"legal","legacy":"legal","pauper":"not_legal","vintage":"legal","penny":"legal","commander":"legal","brawl":"not_legal","historicbrawl":"not_legal","alchemy":"not_legal","paupercommander":"restricted","duel":"legal","oldschool":"not_legal","premodern":"not_legal"},"games":["paper","mtgo"],"reserved":false,"foil":true,"nonfoil":true,"finishes":["nonfoil","foil"],"oversized":false,"promo":false,"reprint":false,"variation":false,"set_id":"c1d109bc-ffd8-428f-8d7d-3f8d7e648046","set":"tsp","set_name":"Time Spiral","set_type":"expansion","set_uri":"https://api.scryfall.com/sets/c1d109bc-ffd8-428f-8d7d-3f8d7e648046","set_search_uri":"https://api.scryfall.com/cards/search?order=set\u0026q=e%3Atsp\u0026unique=prints","scryfall_set_uri":"https://scryfall.com/sets/tsp?utm_source=api","rulings_uri":"https://api.scryfall.com/cards/0000579f-7b35-4ed3-b44c-db2a538066fe/rulings","prints_search_uri":"https://api.scryfall.com/cards/search?order=released\u0026q=oracleid%3A44623693-51d6-49ad-8cd7-140505caf02f\u0026unique=prints","collector_number":"157","digital":false,"rarity":"uncommon","flavor_text":"\"A rift opened, and our arrows were abruptly stilled. To move was to push the world. But the sliver's claw still twitched, red wounds appeared in Thed's chest, and ribbons of blood hung in the air.\"\n—Adom Capashen, Benalish hero","card_back_id":"0aeebaf5-8c7d-4636-9e82-8c27447861f7","artist":"Paolo Parente","artist_ids":["d48dd097-720d-476a-8722-6a02854ae28b"],"illustration_id":"2fcca987-364c-4738-a75b-099d8a26d614","border_color":"black","frame":"2003","full_art":false,"textless":false,"booster":true,"story_spotlight":false,"edhrec_rank":5613,"penny_rank":10533,"prices":{"usd":"0.33","usd_foil":"4.50","usd_etched":null,"eur":"0.38","eur_foil":"1.00","tix":"0.02"},"related_uris":{"gatherer":"https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=109722","tcgplayer_infinite_articles":"https://infinite.tcgplayer.com/search?contentMode=article\u0026game=magic\u0026partner=scryfall\u0026q=Fury+Sliver\u0026utm_campaign=affiliate\u0026utm_medium=api\u0026utm_source=scryfall","tcgplayer_infinite_decks":"https://infinite.tcgplayer.com/search?contentMode=deck\u0026game=magic\u0026partner=scryfall\u0026q=Fury+Sliver\u0026utm_campaign=affiliate\u0026utm_medium=api\u0026utm_source=scryfall","edhrec":"https://edhrec.com/route/?cc=Fury+Sliver"}},
 */

import Foundation

struct CardData: Codable {
    enum CodingKeys: String, CodingKey {
        case object, id, name, lang, released_at, uri, scryfall_uri, layout, highres_image, image_status, cmc, type_line, color_identity, keywords,legalities, reserved, foil, nonfoil, promo, reprint, set_name, scryfall_set_uri, collector_number, rarity, artist, border_color, frame, full_art, textless, booster, story_spotlight
    }
    
    var object: String
    var id: String
    var name: String
    var lang: String
    var released_at: String
    var uri: String //maybe url
    var scryfall_uri: String
    var layout: String
    var highres_image: Bool
    var image_status: String
    var cmc: Double
    var type_line: String
    var color_identity: Array<String>
    var keywords: Array<String>
    var legalities: [String: String]
    var reserved: Bool
    var foil: Bool
    var nonfoil: Bool
    var promo: Bool
    var reprint: Bool
    var set_name: String
    var scryfall_set_uri: String
    var collector_number: String
    var rarity: String
    var artist: String
    var border_color: String
    var frame: String
    var full_art: Bool
    var textless: Bool
    var booster: Bool
    var story_spotlight: Bool
    
    let nullArray: [String] = []
    var emptyDictionary = [String: String]()
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.object = try container.decode(String.self, forKey: .object)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.lang = try container.decodeIfPresent(String.self, forKey: .lang) ?? ""
        self.released_at = try container.decodeIfPresent(String.self, forKey: .released_at) ?? ""
        self.uri = try container.decodeIfPresent(String.self, forKey: .uri) ?? ""
        self.scryfall_uri = try container.decodeIfPresent(String.self, forKey: .scryfall_uri) ?? ""
        self.layout = try container.decodeIfPresent(String.self, forKey: .layout) ?? ""
        self.highres_image = try container.decodeIfPresent(Bool.self, forKey: .highres_image) ?? false
        self.image_status = try container.decodeIfPresent(String.self, forKey: .image_status) ?? ""
        self.cmc = try container.decodeIfPresent(Double.self, forKey: .cmc) ?? 0.0
        self.type_line = try container.decodeIfPresent(String.self, forKey: .type_line) ?? ""
        self.color_identity = try container.decodeIfPresent(Array<String>.self, forKey: .color_identity) ?? nullArray
        self.keywords = try container.decodeIfPresent(Array<String>.self, forKey: .keywords) ?? nullArray
        self.legalities = try container.decodeIfPresent([String: String].self, forKey: .legalities) ?? emptyDictionary
        self.reserved = try container.decodeIfPresent(Bool.self, forKey: .reserved) ?? false
        self.foil = try container.decodeIfPresent(Bool.self, forKey: .foil) ?? false
        self.nonfoil = try container.decodeIfPresent(Bool.self, forKey: .nonfoil) ?? false
        self.promo = try container.decodeIfPresent(Bool.self, forKey: .promo) ?? false
        self.reprint = try container.decodeIfPresent(Bool.self, forKey: .reprint) ?? false
        self.set_name = try container.decodeIfPresent(String.self, forKey: .set_name) ?? ""
        self.scryfall_set_uri = try container.decodeIfPresent(String.self, forKey: .scryfall_set_uri) ?? ""
        self.collector_number = try container.decodeIfPresent(String.self, forKey: .collector_number) ?? ""
        self.rarity = try container.decodeIfPresent(String.self, forKey: .rarity) ?? ""
        self.artist = try container.decodeIfPresent(String.self, forKey: .artist) ?? ""
        self.border_color = try container.decodeIfPresent(String.self, forKey: .border_color) ?? ""
        self.frame = try container.decodeIfPresent(String.self, forKey: .frame) ?? ""
        self.full_art = try container.decodeIfPresent(Bool.self, forKey: .full_art) ?? false
        self.textless = try container.decodeIfPresent(Bool.self, forKey: .textless) ?? false
        self.booster = try container.decodeIfPresent(Bool.self, forKey: .booster) ?? false
        self.story_spotlight = try container.decodeIfPresent(Bool.self, forKey: .story_spotlight) ?? false
        
    }
}
