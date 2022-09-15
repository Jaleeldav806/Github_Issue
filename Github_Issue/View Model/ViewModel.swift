//
//  ViewModel.swift
//  Github_Issue
//
//  Created by Jaleel Davidson on 9/9/22.
//

import Foundation

class ViewModel {
    
    
    var error: Error?
    var arr: [Issues]?
    var callback: (()->())?
    let apiHandler = APIHandler.init()
    
    
    func getError()-> Error? {
        return error
    }
    
    func getDataFromAPI(str: String) {
       
        apiHandler.callback = { arr, error in
            self.arr = arr
            self.error = error
            self.callback?()
        }
        apiHandler.getData(str: str)
    }
    
    func getRowCount() -> Int {
        guard let issues = arr else {
            return 0
        }

        return issues.count
    }
    
    func getDataForCell(at row: Int) -> String {
        guard let issues = arr else {
            return ""
        }
        
        let issue = issues[row]
    
        return "Url: \(issue.url!)\nTitle: \(issue.title!)\nLogin: \(issue.user.login!)\nState: \(issue.state!)\nComments: \(issue.comments!)\nCreated At: \(issue.created_at!)"
    }
    
}

