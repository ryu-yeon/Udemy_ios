//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = Storage().apikey
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    

    func getCoinPrice(for currency: String) {
        
        // String 연결을 사용하여 API 키와 함께 baseURL 끝에 선택한 통화를 추가합니다.
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        // 선택적 바인딩을 사용하여 urlString에서 생성된 URL의 래핑을 해제합니다.
        if let url = URL(string:urlString) {
            let session = URLSession(configuration: .default)
            
            // URLSession에 대한 새 데이터 작업 생성
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                return
            }
                // 다시 받은 데이터를 출력할 수 있도록 문자열로 포맷합니다.
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
            }
            
            // 비트코인 평균 서버에서 데이터를 가져오는 작업을 시작합니다.
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) ->Double? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodeData.rate
//            print(lastPrice)
            
            return lastPrice
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
