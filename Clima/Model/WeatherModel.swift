
// ana 3ayz aldata al
import Foundation
struct WeatherModel {
    let name : String
    let temperature : Double
    let conditionId : Int
    
    
    // properity computed --> dah no3 VAriable mo3yn by7ded al value bta3to 3ala 7asb oberation
    // b tetnfez fe al body bta3o
    // ba3rfo w a7ded Type w lazem yb2a gwa retun men nafs type trg3 alvalue bta3to bona2 3ala al condition
    var condition:String {
        switch conditionId {
        case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                    return "cloud"
           }
    }
    // hya 7elwa fash5 law 3awz t3ml operation 3ala Variable w ba3d kda tst5dm al variable dah mkano
    // ya3ni al variable dah 5las 5at feh data mesh m7tag kol m aga ast5dmo a3ml 3leh operatin la a use this porperity var
    // proprety Computed Variable ---->
    var temp : String {
        return String(format: "%.1f", temperature)
    }
    
    
 
    
}
