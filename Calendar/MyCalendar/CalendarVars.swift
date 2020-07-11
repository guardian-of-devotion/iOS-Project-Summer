//
//  CalendarVars.swift
//  MyCalendar
//
//  Created by Саркис Катвалян on 10/07/2020.
//  Copyright © 2020 Саркис Катвалян. All rights reserved.
//

import Foundation

let date = Date()
let calendar = Calendar.current

let day = calendar.component(.day, from: date)
let weekday = calendar.component(.weekday, from: date)
var month = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)