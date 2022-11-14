//
//  ProcessingInterface.swift
//  SPBGo
//
//  Created by Andrey on 11.11.2022.
//

import Foundation
protocol ProcessingInterface{
    func GetEvents(_ pageSize:Int,_ pageNumber:Int) -> Events
    func GetEventInfo(_ id:Int) -> Event
    
}
