    // file to handle JSON Data from website data that retrive saved here

//  3shan ana at3mel ma3 JSON Data lazem ashof shakl al data json 3amla ezay 3shan abd2 a7dr ezay hast2blha
// leh ba3ml decode 3shan ana bst2bl ya3ni 7aga gayaly w yo3tbr eny ana b fook al shafra
// abos 3ala al json data w abd2 a7ded hast2blha fe srtuct law hya henak fe struct w kda
// kol part fe JSON data leh body mo3yn ana ha5od al data aly feh b eny a3mlo struct shabho w abd2 ast2bl b nafs names of Var in JSOn data
// w ykon 3andy zay struct general

import Foundation
struct WeatherData : Decodable {
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Codable {
    let temp : Double
}

struct Weather : Decodable {
    let description : String
    let main : String
    let id : Int
}
