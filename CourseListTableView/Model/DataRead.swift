//
//  DataRead.swift
//
//
//  Created by Administrator on 11/6/21.
//

import Foundation




func openCSV(fileName:String, fileType: String)-> String!{
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType)
        else {
            return nil
    }
    do {
        let contents = try String(contentsOfFile: filepath, encoding: .utf8)

        return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}

 func parseCSV() -> [course]{

    let dataString: String! = openCSV(fileName: "data", fileType: "csv")
    var items: [(String, String, String, String)] = []
    let lines: [String] = dataString.components(separatedBy: NSCharacterSet.newlines) as [String]
    var courses = [course]()
    for line in lines {
       var values: [String] = []
       if line != "" {
           if line.range(of: "\"") != nil {
               var textToScan:String = line
               var value:String?
               var textScanner:Scanner = Scanner(string: textToScan)
            while !textScanner.isAtEnd {
                   if (textScanner.string as NSString).substring(to: 1) == "\"" {


                       textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)

                       value = textScanner.scanUpToString("\"")
                       textScanner.currentIndex = textScanner.string.index(after: textScanner.currentIndex)
                   } else {
                       value = textScanner.scanUpToString(",")
                   }

                    values.append(value! as String)

                if !textScanner.isAtEnd{
                        let indexPlusOne = textScanner.string.index(after: textScanner.currentIndex)

                    textToScan = String(textScanner.string[indexPlusOne...])
                    } else {
                        textToScan = ""
                    }
                    textScanner = Scanner(string: textToScan)
               }

               // For a line without double quotes, we can simply separate the string
               // by using the delimiter (e.g. comma)
           } else  {
               values = line.components(separatedBy: ",")
           }

           // Put the values into the tuple and add it to the items array
           let item = (values[0], values[1], values[2], values[3])
           items.append(item)
           
           let c = course(courseID: item.0, section: item.1, startDate: item.2, endDate: item.3)
           
           courses.append(c)
           
           
          
        }
        
    }
     return courses
}
