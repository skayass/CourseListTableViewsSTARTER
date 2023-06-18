//
//  CourseListViewController.swift
//  CourseListTableView
//
//  Created by test on 12/2/21.
// Samia Kayass

import UIKit

class CourseListViewController: UITableViewController {
    var courses = parseCSV()
    
    // Connect the table view.
    @IBOutlet var courseTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //for c in courses {
            //print(c)
       // }
    }

    // MARK: - Table view data source
    
    
    // Implement the number of sections.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // Implement the number of rows in section.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }
    
    // Implement how to draw the cell for each time.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Make the cell equal to the table view cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Set the cell label to course ID.
        cell.textLabel?.text = courses[indexPath.row].courseID
        // Set the cell label for the section.
        cell.detailTextLabel?.text = courses[indexPath.row].section
        return cell
    }
    
    // override a function for the did select row( The action that happening when we taps the row)
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(courses[indexPath.row])
        // add a method to bring up the segue.
        self.performSegue(withIdentifier: "showdetail", sender: tableView)
    }

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // Override a function to prepare for segue.
    // Store the data.
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          guard let detailVC = segue.destination as? CourseDetailViewController
            else { return }
          // add an if statement to check what row we are on, before decide what course to store.
          //selectedIndex it returns the row we selected.
          if let selectedIndex = tableView.indexPathForSelectedRow?.row {
              detailVC.courseDetail = courses[selectedIndex]
          }
      }

    
}
    


