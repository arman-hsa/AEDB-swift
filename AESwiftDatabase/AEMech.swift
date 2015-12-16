//
//  AEMech.swift
//  AESwiftDatabase
//
//  Created by Julio Reyes on 11/14/15.
//  Copyright © 2015 Julio Reyes. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

typealias AEMechDetailsInfo = (mechFullName:String, mechBackground:String, mechTechTitle:String, mechTechDetails:String, mechHistoryTitle:String, mechHistoryDetails:String, mechNotesTitle:String, mechNotes:String, mechLink:String)

class AEMech: NSObject {
    
    var selectedMechDetails = [AEMechDetailsInfo]()
    
    // Call the request for the Mechs
    init(jsonObject: AnyObject) {
        let robotJSON = JSON(jsonObject)
        
        if let mechDetailsArray = robotJSON["sections"].array{
            var currentMechName:String = String()
            var currentMechBG:String = String()
            
            var currentMechTechTitle:String = String()
            var currentMechTechDetails:String = String()
            
            var currentHistoryTitle:String = String()
            var currentHistoryDetails:String = String()
            
            var currentNotesTitle:String = String()
            var currentNotes:String = String()
            
            var currentMechLink:String = String()
            
            // Data retrieval
            // Mech Summary
            let mechSummaryDict = mechDetailsArray[0].dictionary!
            currentMechName = mechSummaryDict["title"]!.stringValue
            let mechSummaryContent:Array = mechSummaryDict["content"]!.array!
            for content in mechSummaryContent{
                if let text:String = content["text"].stringValue{
                    currentMechBG.appendContentsOf(text)
                }
            }
            
            // Mech Technology & Characteristics
            let mechTechDict = mechDetailsArray[1].dictionary!
            currentMechTechTitle = mechTechDict["title"]!.stringValue
            let mechTechContent:Array = mechTechDict["content"]!.array!
            for content in mechTechContent{
                if let text:String = content["text"].stringValue{
                    currentMechTechDetails.appendContentsOf(text)
                }
            }
            
            // Mech History
            let mechHistoryDict = mechDetailsArray[2].dictionary!
            currentHistoryTitle = mechHistoryDict["title"]!.stringValue
            let mechHistoryContent:Array = mechTechDict["content"]!.array!
            for content in mechHistoryContent{
                if let text:String = content["text"].stringValue{
                    currentHistoryDetails.appendContentsOf(text)
                }
            }
    
            // Mech Notes & Trivia
            let mechNotesDict = mechDetailsArray[3].dictionary!
            currentNotesTitle = mechNotesDict["title"]!.stringValue
            let mechNotesContent:Array = mechTechDict["content"]!.array!
            for content in mechNotesContent{
                if let elements = content["elements"].array{
                    for element in elements{
                        currentNotes.appendContentsOf(element.stringValue)
                    }
                }
            }
            
            //External Links? Gottatfigure how to grab the URL of Google's Search query
            currentMechLink = mechDetailsArray[4]["content"][0]["elements"][0]["text"].stringValue
            
            let currentMechDetails:AEMechDetailsInfo = (mechFullName:currentMechName, mechBackground:currentMechBG,
                mechTechTitle:currentMechTechTitle,
                mechTechDetails:currentMechTechDetails,
                mechHistoryTitle:currentHistoryTitle,
                mechHistoryDetails:currentHistoryDetails,
                mechNotesTitle:currentNotesTitle,
                mechNotes:currentNotes,
                mechLink:currentMechLink)
            
            selectedMechDetails.append(currentMechDetails)
        }
        
    }
}
