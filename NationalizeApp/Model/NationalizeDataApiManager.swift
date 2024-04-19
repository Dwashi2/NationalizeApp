//
//  NationalizeDataApiManager.swift
//  NationalizeApp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import Foundation

protocol NationalizeDataApiManagerDelegate: AnyObject {
    func checkNational(_ natiManager: NationalizeDataApiManager, nat: NationalizeData)
    func didFailWithError(error: Error)
}

struct NationalizeDataApiManager {
    let apiURL = Constants.url
    
    weak var delegate: NationalizeDataApiManagerDelegate?
    
    func fetchNationalize(name: String) -> String {
        let urlString = "\(apiURL)\(name)"
        return urlString
    }
    
    func performRequest(with urlString: String){
        //MARK: - 1 Create a url
        if let url = URL(string: urlString) {
            
            //MARK: - 2 create a urlsession
            let session = URLSession(configuration: .default)
            
            //MARK: - 3 give the session task
            let task = session.dataTask(with: url){ (data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let natData = parseJSON(safeData)  {
                        delegate?.checkNational(self, nat: natData)
                    }
                }
            }
            //MARK: - Start the task
            task.resume()
        }
    }
    
    func parseJSON(_ natData: Data) -> NationalizeData? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NationalizeData.self, from: natData)
            return decodedData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
