//
//  sortSettingsContentView.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 8/13/22.
//

import SwiftUI

struct sortSettingsContentView: View {
    @State static var userPrice: String = ""
    @State private var showSheet = false
    struct sortManager {
        static var sortParam = "null"
        static var canSort = false
        //@State static var userPrice: String = ""
        //static var sortParamNum = 0
    }
    
    var body: some View {
        Menu {
            
            Menu {
                Button("0", role: .destructive) {
                    sortManager.sortParam = "0.0"
                    sortManager.canSort = true
                }
                
                Button("1", role: .destructive) {
                    sortManager.sortParam = "1.0"
                    sortManager.canSort = true
                }
                
                Button("2", role: .destructive) {
                    sortManager.sortParam = "2.0"
                    sortManager.canSort = true
                }
                
                Button("3", role: .destructive) {
                    sortManager.sortParam = "3.0"
                    sortManager.canSort = true
                }
                
                Button("4", role: .destructive) {
                    sortManager.sortParam = "4.0"
                    sortManager.canSort = true
                }
                
                Button("5", role: .destructive) {
                    sortManager.sortParam = "5.0"
                    sortManager.canSort = true
                }
                
                Button("6", role: .destructive) {
                    sortManager.sortParam = "6.0"
                    sortManager.canSort = true
                }
                
                Button("7", role: .destructive) {
                    sortManager.sortParam = "7.0"
                    sortManager.canSort = true
                }
                
                Button("8", role: .destructive) {
                    sortManager.sortParam = "8.0"
                    sortManager.canSort = true
                }
                
                Button("9+", role: .destructive) {
                    sortManager.sortParam = "9+"
                    sortManager.canSort = true
                }
            } label: {
                Label("CMC", systemImage: "c.circle")
            }
            
            Menu {
                Button("Creature", role: .destructive) {
                    sortManager.sortParam = "Creature"
                    sortManager.canSort = true
                }
                
                Button("Land", role: .destructive) {
                    sortManager.sortParam = "Land"
                    sortManager.canSort = true
                }
                
                Button("Artifact", role: .destructive) {
                    sortManager.sortParam = "Artifact"
                    sortManager.canSort = true
                }
                
                Button("Enchantment", role: .destructive) {
                    sortManager.sortParam = "Enchantment"
                    sortManager.canSort = true
                }
                
                Button("Sorcery", role: .destructive) {
                    sortManager.sortParam = "Sorcery"
                    sortManager.canSort = true
                }
                
                Button("Instant", role: .destructive) {
                    sortManager.sortParam = "Instant"
                    sortManager.canSort = true
                }
                
                Button("Planeswalker", role: .destructive) {
                    sortManager.sortParam = "Planeswalker"
                    sortManager.canSort = true
                }
            } label: {
                Label("Card type", systemImage: "t.circle")
            }
            
            Menu {
                Button("Blue", role: .destructive) {
                    sortManager.sortParam = "U"
                    sortManager.canSort = true
                }
                
                Button("White", role: .destructive) {
                    sortManager.sortParam = "W"
                    sortManager.canSort = true
                }
                
                Button("Red", role: .destructive) {
                    sortManager.sortParam = "R"
                    sortManager.canSort = true
                }
                
                Button("Green", role: .destructive) {
                    sortManager.sortParam = "G"
                    sortManager.canSort = true
                }
                
                Button("Black", role: .destructive) {
                    sortManager.sortParam = "B"
                    sortManager.canSort = true
                }
            } label: {
                Label("Color", systemImage: "circle.hexagonpath.fill")
            }
            
            Menu {
                Button("Mythic rare", role: .destructive) {
                    sortManager.sortParam = "mythic rare"
                    sortManager.canSort = true
                }
                
                Button("Rare", role: .destructive) {
                    sortManager.sortParam = "rare"
                    sortManager.canSort = true
                }
                
                Button("Uncommon", role: .destructive) {
                    sortManager.sortParam = "uncommon"
                    sortManager.canSort = true
                }
                
                Button("Common", role: .destructive) {
                    sortManager.sortParam = "common"
                    sortManager.canSort = true
                }
            } label: {
                Label("Rarity", systemImage: "rhombus")
            }
            
            Menu {
                Button("Foil", role: .destructive) {
                    sortManager.sortParam = "foil"
                    sortManager.canSort = true
                }
                
                Button("Non-foil", role: .destructive) {
                    sortManager.sortParam = "non-foil"
                    sortManager.canSort = true
                }
            } label: {
                Label("Finish", systemImage: "sparkles")
            }
            
            Button("Sort By Price", role: .destructive) {
                sortManager.sortParam = "Price"
                sortManager.canSort = true
                
                
                
            }
        } label: {
            Label("Choose sort parameter", systemImage: "menucard")
        }
    }
    
    /*public static func getPrice() -> String {
        return userPrice
    }//returns price entered by user*/

}

struct sortSettingsContentView_Previews: PreviewProvider {
    static var previews: some View {
        sortSettingsContentView()
    }
}


/**
 {"object":"card","id":"0000579f-7b35-4ed3-b44c-db2a538066fe","oracle_id":"44623693-51d6-49ad-8cd7-140505caf02f","multiverse_ids":[109722],"mtgo_id":25527,"mtgo_foil_id":25528,"tcgplayer_id":14240,"cardmarket_id":13850,"name":"Fury Sliver","lang":"en","released_at":"2006-10-06","uri":"https://api.scryfall.com/cards/0000579f-7b35-4ed3-b44c-db2a538066fe","scryfall_uri":"https://scryfall.com/card/tsp/157/fury-sliver?utm_source=api","layout":"normal","highres_image":true,"image_status":"highres_scan","image_uris":{"small":"https://c1.scryfall.com/file/scryfall-cards/small/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","normal":"https://c1.scryfall.com/file/scryfall-cards/normal/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","large":"https://c1.scryfall.com/file/scryfall-cards/large/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","png":"https://c1.scryfall.com/file/scryfall-cards/png/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.png?1562894979","art_crop":"https://c1.scryfall.com/file/scryfall-cards/art_crop/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979","border_crop":"https://c1.scryfall.com/file/scryfall-cards/border_crop/front/0/0/0000579f-7b35-4ed3-b44c-db2a538066fe.jpg?1562894979"},"mana_cost":"{5}{R}","cmc":6.0,"type_line":"Creature — Sliver","oracle_text":"All Sliver creatures have double strike.","power":"3","toughness":"3","colors":["R"],"color_identity":["R"],"keywords":[],"legalities":{"standard":"not_legal","future":"not_legal","historic":"not_legal","gladiator":"not_legal","pioneer":"not_legal","explorer":"not_legal","modern":"legal","legacy":"legal","pauper":"not_legal","vintage":"legal","penny":"legal","commander":"legal","brawl":"not_legal","historicbrawl":"not_legal","alchemy":"not_legal","paupercommander":"restricted","duel":"legal","oldschool":"not_legal","premodern":"not_legal"},"games":["paper","mtgo"],"reserved":false,"foil":true,"nonfoil":true,"finishes":["nonfoil","foil"],"oversized":false,"promo":false,"reprint":false,"variation":false,"set_id":"c1d109bc-ffd8-428f-8d7d-3f8d7e648046","set":"tsp","set_name":"Time Spiral","set_type":"expansion","set_uri":"https://api.scryfall.com/sets/c1d109bc-ffd8-428f-8d7d-3f8d7e648046","set_search_uri":"https://api.scryfall.com/cards/search?order=set\u0026q=e%3Atsp\u0026unique=prints","scryfall_set_uri":"https://scryfall.com/sets/tsp?utm_source=api","rulings_uri":"https://api.scryfall.com/cards/0000579f-7b35-4ed3-b44c-db2a538066fe/rulings","prints_search_uri":"https://api.scryfall.com/cards/search?order=released\u0026q=oracleid%3A44623693-51d6-49ad-8cd7-140505caf02f\u0026unique=prints","collector_number":"157","digital":false,"rarity":"uncommon","flavor_text":"\"A rift opened, and our arrows were abruptly stilled. To move was to push the world. But the sliver's claw still twitched, red wounds appeared in Thed's chest, and ribbons of blood hung in the air.\"\n—Adom Capashen, Benalish hero","card_back_id":"0aeebaf5-8c7d-4636-9e82-8c27447861f7","artist":"Paolo Parente","artist_ids":["d48dd097-720d-476a-8722-6a02854ae28b"],"illustration_id":"2fcca987-364c-4738-a75b-099d8a26d614","border_color":"black","frame":"2003","full_art":false,"textless":false,"booster":true,"story_spotlight":false,"edhrec_rank":5613,"penny_rank":10533,"prices":{"usd":"0.33","usd_foil":"4.50","usd_etched":null,"eur":"0.38","eur_foil":"1.00","tix":"0.02"},"related_uris":{"gatherer":"https://gatherer.wizards.com/Pages/Card/Details.aspx?multiverseid=109722","tcgplayer_infinite_articles":"https://infinite.tcgplayer.com/search?contentMode=article\u0026game=magic\u0026partner=scryfall\u0026q=Fury+Sliver\u0026utm_campaign=affiliate\u0026utm_medium=api\u0026utm_source=scryfall","tcgplayer_infinite_decks":"https://infinite.tcgplayer.com/search?contentMode=deck\u0026game=magic\u0026partner=scryfall\u0026q=Fury+Sliver\u0026utm_campaign=affiliate\u0026utm_medium=api\u0026utm_source=scryfall","edhrec":"https://edhrec.com/route/?cc=Fury+Sliver"}},
 */
