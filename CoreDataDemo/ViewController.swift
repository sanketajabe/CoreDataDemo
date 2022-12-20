//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Apple on 16/12/22.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//Mark:- Creating Class insert
        let coredata = Coredata()
        coredata.insertEmployeeRecords()
        coredata.retriveEmployeeRecords()
        print("------------------------------")
        coredata.updateEmployeeRecords()
        coredata.retriveEmployeeRecords()
        print("------------------------------")
        coredata.deleteEmployeeRecords()
        coredata.retriveEmployeeRecords()
    }
}

