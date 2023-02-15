//
//  WeatherViewController.swift
//  SimpleWeather
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var CityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 도시들 저장
    let cities = ["Seoul", "Tokyo", "LA", "New York"]
    // 날씨 요소들
    let weathers = ["cloud.fill", "sun.max.fill", "wind", "cloud.sun.fill", "cloud.rain.fill"]

    
    @IBAction func ButtonTapped(_ sender: Any) {
        print("button tapped")
        
        CityLabel.text = cities.randomElement()
        
        // 버튼누르면 날씨 이미지도 바뀌어야함
        let imageName = weathers.randomElement()!
        weatherImageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        //
        
        let randonTemp = Int.random(in: 10..<30)
        temperatureLabel.text = "\(randonTemp)°"
        
    }
    
    
}
