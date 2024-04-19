//
//  NationalizeViewController.swift
//  NationalizeApp
//
//  Created by Daniel Washington Ignacio on 19/04/24.
//

import UIKit


class NationalizeViewController: UIViewController {
    
    private lazy var contentView = NationalizeView()
    private var nationalizeApiManager = NationalizeDataApiManager()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nationalizeApiManager.delegate = self
        contentView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.backgroundColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00)
    }
    
    func callApi(nameContentView: String){
        let nameStr = nationalizeApiManager.fetchNationalize(name: nameContentView)
        nationalizeApiManager.performRequest(with: nameStr)
    }
    
    func calc(number: Float) -> String{
        let value = number * 100
        return String(format: "%.f", value)
    }
}

//MARK: - NationalizeDataApiManagerDelegate

extension NationalizeViewController: NationalizeDataApiManagerDelegate {
    func checkNational(_ natiManager: NationalizeDataApiManager, nat: NationalizeData) {
        DispatchQueue.main.async {
            self.contentView.labelAnswer.text = "\(String(describing: self.contentView.textFieldName.text ?? "")) is from \(nat.country.first?.country_id ?? "") with \(self.calc(number: nat.country.first?.probability ?? 0.0))% certainty"
        }
    }
    
    func didFailWithError(error: any Error) {
        print(error.localizedDescription)
    }
    
}

//MARK: - NationalizeViewDelegate

extension NationalizeViewController: NationalizeViewDelegate {
    func clickButtonToCallApi() {
        callApi(nameContentView: contentView.textFieldName.text ?? "")
    }
    
    
}
