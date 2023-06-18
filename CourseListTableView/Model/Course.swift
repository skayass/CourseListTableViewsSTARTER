//
//  Course.swift
//  CourseListTableView
//
//  Created by Administrator on 11/7/21.
//

import Foundation

struct course {
    var courseID: String
    var section:String
    var startDate:String
    var endDate:String
    
    var description: String {
        return "Course:\(courseID) Section:\(section) starts on \(startDate) and ends on \(endDate)"
    }
}
