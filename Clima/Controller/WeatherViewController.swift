//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController{
   
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManger = WeatherManger()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManger.delegate = self
        searchTextField.delegate = self
    }
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
}

//MARK:- UITextField delegte method
extension WeatherViewController : UITextFieldDelegate  {
    
    // call when tab on go button aw send  ,responsible for return button , like what should i do after user tap on go or send
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true) // awl mydos go aw search hide keyboard
        return true
    }

    // call when user type somthing wrong w anta 3awz t dello hint aw you can use this method to validate the contents of the text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if (textField.text != ""){
            return true
        } else{
            textField.placeholder = "Please enter a city name" // give user hint
            return false
             }
    }
    // call awl lam al user y5ls ktaba w ydos go aw search  fre textfield a3ml eh ?
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherManger.getweater(cityName: textField.text!)
        textField.text = ""
    }
}

//MARK:- WeatherManagerDelegate method

extension WeatherViewController: WeatherManagerDelegate{
    func updateWeather(_ weatherManager:WeatherManger,weather: WeatherModel) {
        DispatchQueue.main.async {
            print(weather.condition)
            self.conditionImageView.image = UIImage(systemName: weather.condition)
            self.cityLabel.text = weather.name
            self.temperatureLabel.text = weather.temp
        }
    }
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
