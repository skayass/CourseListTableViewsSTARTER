//
//  CourseDetailViewController.swift
//  CourseListTableView
//
//  Created by test on 12/2/21.
// Samia Kayass

import UIKit

class CourseDetailViewController: UIViewController {
    
    // Create a variable for the single course object.
    var courseDetail: course!
    
    //Add IBOutlet for the view and the labels.
    @IBOutlet var detailView: UIView!
    @IBOutlet var courseIdLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call the function.
        updateView()

        // Do any additional setup after loading the view.
    }
    
   // Create a function to update the view.
    func updateView() {
        courseIdLabel.text = courseDetail.courseID
        startDateLabel.text = courseDetail.startDate
        endDateLabel.text = courseDetail.endDate
        
    }


}
