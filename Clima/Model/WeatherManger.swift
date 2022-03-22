//
//  WeatherManger.swift
//  Clima
//
//  Created by Abdallah Ehab on 23/09/2021.


import Foundation

protocol WeatherManagerDelegate {
    func updateWeather(_ weatherManager:WeatherManger,weather:WeatherModel)
    func didFailWithError(error:Error)
}
struct WeatherManger {
    
let url = "https://api.openweathermap.org/data/2.5/weather?&units=metric&appid=3ea4f127f93b5a83c67aafa569ffd55f"
    
    var delegate: WeatherManagerDelegate?
    func getweater(cityName:String){
        let stringURL = "\(url)&q=\(cityName)"
        request(with: stringURL)
    }
    
    // networking
    func request (with stringURL:String){
        // give URL from type URl adeto url string value bel method url optional pind 3shan URL optonal
        if let url = URL(string: stringURL) {
            
        //create a URL session Configure session to take this session var and handle with it
        let session = URLSession(configuration: .default)
            
        //give a session task adelo task y3mlha aly hya ygeb aldata (retrive content of given URL)
            let task = session.dataTask(with: url) { (data, Response, error) in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safedata = data {
                    if let weather = parseJSON(safedata){
                        delegate?.updateWeather( self, weather: weather)
                    }
        
                    // data 3ala hay2et String dont useful
                    //    let dataString = String(data: safedata, encoding: .utf8) // 7atet al data aly w5dha men website fe variable
                }
            }
            
        // Start session  3shan t start task lazem t call command altsh8ell
            task.resume()
        }
    }
    
    // al func de b t handle ma3 al struct aly ana mest2bel fe JSONdata al2tnen marboten n ba3d
    // ya3ni ana lazem al JSON Data ast2blhe b format m03yn zay mana m 3amlel fe Structweather data
    // bas bardo aly haysh8l al data de w y7wlha hwa code aly fe func de 3shan kda homa mortabten ma3 b3d
    // w al2tnen asay ma3 ba3d ma2drsh a handle al3amlya 8er ama ykono al 2tnen sha8len bel twazy
    
    func parseJSON(_ jsonData:Data)->WeatherModel?{ // use _ as external param in call no nam of param need
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: jsonData)
            let name = decodedData.name
            let temp = decodedData.main.temp
            let id =  decodedData.weather[0].id
            
            // fa 3shan ana b2a 3awz  data aly rg3t de w mesh 3awz afdl aktb alfunc de 3shan a3rf ast5dmha
            // f 3ashan keda 3mlt struct file monfsel w ha5od fel data de 3and al initilization
            let weather = WeatherModel(name: name, temperature: temp, conditionId: id)
            return weather
    
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}

