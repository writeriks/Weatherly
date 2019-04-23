//
//  WeatherCell.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import UIKit

class WeatherCell: BaseCell {
    
    var resultData:DataViewModel!{
        didSet{
            temperatureLabel.text = resultData.temperatureMaxText
            humidityLabel.text = resultData.humidityText
            pressureLabel.text = resultData.pressureText
            windSpeedLabel.text = resultData.windSpeedText
            descriptionLabel.text = resultData.summaryText
            dateLabel.text = resultData.timeText
        }
    }
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Date"
        return label
    }()
    
    let temperatureLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Temperature"
        return label
    }()
    
    let humidityLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "humidity"
        return label
    }()
    
    let pressureLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "pressure"
        return label
    }()
    
    let windSpeedLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "windSpeed"
        return label
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "description"
        return label
    }()
    
    let weatherImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.black
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func setUpViews() {
        
        addSubview(dateLabel)
        addSubview(temperatureLabel)
        addSubview(weatherImageView)
        addSubview(humidityLabel)
        addSubview(pressureLabel)
        addSubview(windSpeedLabel)
        addSubview(descriptionLabel)
        
        dateLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5).isActive = true
        
        temperatureLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        temperatureLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: 5).isActive = true
        
        weatherImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        weatherImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 6).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width / 6).isActive = true
        
        humidityLabel.leftAnchor.constraint(equalTo: weatherImageView.rightAnchor, constant: 20).isActive = true
        humidityLabel.centerYAnchor.constraint(equalTo: weatherImageView.centerYAnchor).isActive = true
        
        pressureLabel.leftAnchor.constraint(equalTo: humidityLabel.rightAnchor, constant: 30).isActive = true
        pressureLabel.centerYAnchor.constraint(equalTo: humidityLabel.centerYAnchor).isActive = true
        
        windSpeedLabel.leftAnchor.constraint(equalTo: pressureLabel.rightAnchor, constant: 30).isActive = true
        windSpeedLabel.centerYAnchor.constraint(equalTo: pressureLabel.centerYAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant:5).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: weatherImageView.rightAnchor, constant: 20).isActive = true
    }
}
