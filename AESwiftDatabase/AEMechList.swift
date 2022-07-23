//
//  AEMechList.swift
//  AESwiftDatabase
//
//  Created by arman on 12/9/15.
//  Copyright © 2015 arman. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

typealias AEMechInformation = (mechID:String,mechName:String, mechURL:String, type:String, abstract:String, thumbnail: String,
    originalDimensionWidth: Int, originalDimensionHeight: Int);

class AEMechList: NSObject {
    var mechID:String?
    var mechInformation = [AEMechInformation]();
    
    var firstMech:AEMechInformation!{
        if !mechInformation.isEmpty{
            return mechInformation[0];
        }else{
            return nil;
        }
    }
    
    // Call the request for the Mechs
    init(jsonObject: AnyObject) {
        let json = JSON(jsonObject)
        
        if let mechArray = json["items"].array{
            for mech in mechArray{
                self.mechID = mech["id"].stringValue
                let mechName = mech["title"].stringValue
                let mechID = mech["id"].stringValue
                let mechURL = mech["url"].stringValue
                let mechType = mech["url"].stringValue
                let mechAbstact = mech["url"].stringValue
                let mechThumbnail = mech["url"].stringValue
                let mechDimensionsWidth = mech["original_dimensions"]["width"].intValue
                let mechDimensionsHeight = mech["original_dimensions"]["height"].intValue
                
                let currentMech: AEMechInformation = (mechID: mechID, mechName: mechName, mechURL: mechURL, type: mechType, abstract: mechAbstact, thumbnail: mechThumbnail,
                    originalDimensionWidth: mechDimensionsWidth, originalDimensionHeight: mechDimensionsHeight)
                
                mechInformation.append(currentMech)
            }
        }else{
            
        }
    }// end init
}