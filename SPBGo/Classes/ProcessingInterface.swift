//
//  ProcessingInterface.swift
//  SPBGo
//
//  Created by Andrey on 11.11.2022.
//
import UIKit
import Foundation
class ProcessingInterface{
    var processData:ProcessingData! = ProcessingData()
    func GetEvents(_ pageSize:Int,_ pageNumber:Int){
        //processData.GetEvents(pageSize, pageNumber)
    }
    func GetEventInfo(_ id:Int) -> Event{
        processData.GetEventInfo(id)
    }
    init(){}

}
