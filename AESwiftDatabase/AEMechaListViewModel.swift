//
//  AEMechaListViewModel.swift
//  AESwiftDatabase
//
//  Created by Julio Reyes on 11/14/15.
//  Copyright © 2015 Julio Reyes. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftyJSON

import Alamofire

class AEMechaListViewModel: NSObject {

    struct URLs {
        static let GundamWikiBaseURL = "http://gundam.wikia.com"
        static let ArticleDetailEndpoint = "api/v1/Articles/Details?"
        static let ArticleEndpoint = "api/v1/Articles/AsSimpleJson?"
        static let parameters = ["ids": "1503",
            "abstract": 100,
            "width": 200,
            "height": 200]
    }
    
    // MARK: Bag
    var disposeBag = DisposeBag()
    
    // MARK: Model Setup
    var mech: AEMechList?{
        didSet{
            if mech?.mechID != nil { updateModel() }
        }
    }
    
    // MARK: UI Setup
    var vignetteImage = PublishSubject<UIImage?>()
    var mechaName = PublishSubject<String!>()
    var mechaDescription = PublishSubject<String!>()
    private var mecha:[AEMechInformation]? // typealias instance
    
    var mechTableViewData = PublishSubject<[([AEMechInformation])]>()
    
    func updateModel(){
        mecha = mech?.mechInformation
        if mecha != nil { setUpMechData() }
    }
    
    
    // Parse mech data to table view
    func setUpMechData(){
        if let currentMech = mecha{
            mechTableViewData.on(.Next(Array(arrayLiteral: currentMech)))
        }
    }
    
    func getAllMechsFromRequest(){
        Alamofire.request(.GET, URLs.GundamWikiBaseURL + URLs.ArticleDetailEndpoint, parameters: URLs.parameters, encoding: .JSON, headers: nil).responseJSON{
            gundamresponse in
            
            if gundamresponse.result.isSuccess{
                let jsonDic = gundamresponse.result.value as! NSDictionary
                print(jsonDic)
            }
            
        }
        
    }
    
    // MARK: Details Setups
    var mechDetailName = PublishSubject<String!>()
    
    func getDetailsForMech(){
        
    }
    
}
