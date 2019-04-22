//
//  WeatherCVC.swift
//  Weatherly
//
//  Created by Emir haktan Ozturk on 8.04.2019.
//  Copyright © 2019 emirhaktan. All rights reserved.
//

import UIKit

private let reuseIdentifierForWeather = "WeatherCell"

class WeatherCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    //    var weather = Weather()
    //    var weather : Weather?
    
    var weatherViewModel:WeatherViewModel?
    var data = [DataViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weather"
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        
        self.fetchData()
        self.collectionView!.register(WeatherCell.self, forCellWithReuseIdentifier: reuseIdentifierForWeather)
    }
    
    private func fetchData(){
        Service.sharedInstance.getDailyWeather(onSuccess: { (weathers) in
            self.data = weathers.daily.data.map({return DataViewModel(data: $0)})
            self.weatherViewModel = WeatherViewModel(weather: weathers)
            self.title = self.weatherViewModel?.timezone
            //            self.weather = weathers
            self.collectionView?.reloadData()
        }) { (error) in
            print(error)
        }
    }
}

extension WeatherCVC{
    // MARK: UICollectionView Delegate and DataSource Methods
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (self.view.frame.width-16-16) * 9 / 32
        return CGSize(width: view.frame.width-8-8, height: height)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        //        guard let count = self.weather?.daily.data.count else {return 1}
        
        //        return count
        
        return self.data.count
        
        //        return self.weather.daily.data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForWeather, for: indexPath) as! WeatherCell
        //        if weather?.daily.data[indexPath.row] != nil{
        //            cell.resultWeather = weather?.daily.data[indexPath.row]
        //            return cell
        //        }
        
        cell.resultData = data[indexPath.row]
        return cell
    }
}
