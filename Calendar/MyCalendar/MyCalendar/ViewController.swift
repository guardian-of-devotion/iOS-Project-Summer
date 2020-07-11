//
//  ViewController.swift
//  MyCalendar
//
//  Created by Саркис Катвалян on 10/07/2020.
//  Copyright © 2020 Саркис Катвалян. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
     @IBOutlet weak var MonthLabel: UILabel!
       @IBOutlet weak var Calendar: UICollectionView!
    

    @IBAction func Back(_ sender: Any) {
        switch currentMonth {
        case "January":
            month = 11
            year -= 1
            Direction = -1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            
             MonthLabel.text = "\(currentMonth) \(year)"
                       
                       Calendar.reloadData()
        default:
            month -= 1
            Direction = -1
            currentMonth = Months[month]
            
            GetStartDateDayPosition()
            
             MonthLabel.text = "\(currentMonth) \(year)"
                       
                       Calendar.reloadData()
        }
        
    }
    @IBAction func Next(_ sender: Any) {
        switch currentMonth {
        case "December":
            month = 0
            year += 1
            Direction = 1
            
            if LeapYearCounter < 5 {
                LeapYearCounter += 1
            }
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            if LeapYearCounter == 5 {
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            
            Calendar.reloadData()
        default:
            
            Direction = 1
            
            GetStartDateDayPosition()
            month += 1
            currentMonth = Months[month]
            
            MonthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
   
    
    let Months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let DaysOfMonth = ["Monday", "Thuesday", "Wednesday", "Thirsday", "Friday", "Saturday", "Sunday"]
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int() // The number of "empty boxes" at the start of the current month
    
    var NextNumberOfEmptyBox = Int() // The same with above but with the next month
    
    var PreviousNumberOfEmptyBox = 0 // The same with above but with the previous month
    
    var Direction = 0 // = 0 if we are at the current month, = 1 if we are in a future month, = -1 if we are in a past month
    
    var PositionIndex = 0 // here we will store the above vars of the empty boxes
    
    var LeapYearCounter = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        currentMonth = Months[month]
        
        MonthLabel.text = "\(currentMonth) \(year)"
        
        
    }
    func GetStartDateDayPosition() { // this function gives us the number of empty boxes
        switch Direction {
        case 0: // if we are at the current month
            switch day {
            case 1...7:
                NumberOfEmptyBox = weekday - day
            case 8...14:
                NumberOfEmptyBox = weekday - day - 7
            case 15...21:
                NumberOfEmptyBox = weekday - day - 14
            case 22...28:
                NumberOfEmptyBox = weekday - day - 21
            case 29...31:
                NumberOfEmptyBox = weekday - day - 28
            default:
                break
            }
            PositionIndex = NumberOfEmptyBox
            
        case 1...: // if we are at a future month
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1: // if we are ar a past month
            PreviousNumberOfEmptyBox = (7-(DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction {              // it returns the number of days in the month + the number of "empty boxes" based on the direction we are going
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] - PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        cell.DateLabel.textColor = UIColor.black
        
        if cell.isHidden {
            cell.isHidden = false
        }
        
        switch Direction {
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        
        default:
            fatalError()
        }
        if Int(cell.DateLabel.text!)! < 1 {
        cell.isHidden = true
        }
        
        switch indexPath.row {
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)!>0 {
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
    return cell
    }
}

