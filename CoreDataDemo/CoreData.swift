//
//  CoreData.swift
//  CoreDataDemo
//
//  Created by Apple on 16/12/22.
//

import Foundation
import UIKit
import CoreData

class Coredata{
    init(){
        
    }
    
//Mark:- Insert Record In Employee Table
    func insertEmployeeRecords(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let empEntity = NSEntityDescription.entity(forEntityName: "Employee", in: managedContext)
        for i in 1...3{
            let emp = NSManagedObject(entity: empEntity!, insertInto: managedContext)
            emp.setValue(i, forKey: "empId")
            emp.setValue("Employee -\(i)", forKey: "empName")
            emp.setValue(i*25000, forKey: "salary")
        }
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Data Cannot be saved \(error)")
        }
    }
    
//Mark:- Display Record In Employee Table
    func retriveEmployeeRecords(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        
        do{
            let fetchResult = try managedContext.fetch(fetchRequest)
            
            for eachFetchResult in fetchResult as! [NSManagedObject]{
                print("The employee Records \(eachFetchResult.value(forKey: "empId")) -- \(eachFetchResult.value(forKey: "empName")) -- \(eachFetchResult.value(forKey: "salary"))")
            
            }
        }catch{
            print("error")
        }
    }

//Mark:- Insert Record In Employee Table
    func updateEmployeeRecords(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequestQueryForUpdate : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Employee")
        
        fetchRequestQueryForUpdate.predicate = NSPredicate(format: "empName = %@", "Employee -1")
        do{
            let empObjects = try managedContext.fetch(fetchRequestQueryForUpdate)
            let empObject = empObjects[0] as! NSManagedObject
            empObject.setValue("Employee - 4", forKey: "empName")
            empObject.setValue(4, forKey: "empId")
            empObject.setValue("Employee - 4", forKey: "empName")
        }catch{
            print("error in updating records")
        }
    }
    
//Mark:- Insert Record In Employee Table
    func deleteEmployeeRecords(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequestForDelete : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        fetchRequestForDelete.predicate = NSPredicate(format: "empName =%@", "Employee -3")
        do{
            let employees = try managedContext.fetch(fetchRequestForDelete)
            let employeeRecordToBeDeleted = employees[0] as! NSManagedObject
            managedContext.delete(employeeRecordToBeDeleted)
            print("employee record \(employeeRecordToBeDeleted) is deleted")
            do{
                try managedContext.save()
            }catch{
                print("error")
            }
            
        }catch{
            print("Employee Record Deletion failed")
        }
    }
}
