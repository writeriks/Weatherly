//
//  WeatherCVC.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import UIKit

private let reuseIdentifierForWeather = "WeatherCell"

class WeatherCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout, UIUpdaterProtocol {
    
    var weatherData : WeatherViewModel?
    var weatherDailyData = [DailyDataViewModel]()
    
    var dataStore:DataStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weather"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        
        dataStore = DataStore(uiUpdater: self)
        self.fetchData()
        
        self.collectionView!.register(WeatherCell.self, forCellWithReuseIdentifier: reuseIdentifierForWeather)
    }
    
    func fetchData(){
        dataStore.fetchWeatherData()
    }
    
    func updateUI(weather:Weather){
        guard let data = weather.dailyDatas else {return}
        self.weatherDailyData = data.map({return DailyDataViewModel(dailyData: $0)})
        self.weatherData = WeatherViewModel(weather: weather)
        self.title = self.weatherData?.timezone
        self.collectionView?.reloadData()
    }
}

extension WeatherCVC{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (self.view.frame.width-16-16) * 9 / 32
        return CGSize(width: view.frame.width-8-8, height: height)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.weatherDailyData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForWeather, for: indexPath) as! WeatherCell
        cell.resultData = self.weatherDailyData[indexPath.row]
        return cell
    }
}
