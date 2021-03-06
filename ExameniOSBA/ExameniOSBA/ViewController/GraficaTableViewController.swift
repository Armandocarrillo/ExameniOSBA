//
//  GraficaTableViewController.swift
//  ExameniOSBA
//
//  Created by Armando Carrillo on 11/02/21.
//

import UIKit
import Alamofire
import SwiftyJSON


class GraficaTableViewController: UITableViewController {
   
    
    var arrayQuestionText = [String]()
    var arrayColors = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        fetchData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayQuestionText.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = arrayQuestionText[indexPath.row]
           
            return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GraficaTableViewController {
  func fetchData() {
    // 1
    /*
    let request = AF.request("https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")
    request.responseDecodable(of: Welcome.self) { (response) in
      guard let welcomes = response.value else { return }
        print(welcomes.questions[0].text)
      */
        /*
        AF.request("https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")
            .validate()
            .responseDecodable(of: Welcome.self) { (response) in
                guard let welcomes = response.value else { return }
                print(welcomes.questions[0].text)
               
                
              }*/
    
    let url = "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld"
    AF.request(url, method: .get).responseJSON { (myResponde) in
        switch myResponde.result {
        case .success:
            //print(myResponde.result)
            
            let myResult = try? JSON(data:myResponde.data!)
            //print(myResult)
            //print(myResult!["questions"])
            print(myResult!["colors"])
            
            
            
            let resultArray = myResult!["questions"]
            self.arrayQuestionText.removeAll()
            for i in resultArray.arrayValue{
                //print(i)
                
                let questionText = i["text"].stringValue
                self.arrayQuestionText.append(questionText)
                
            }
            self.tableView.reloadData()
            
            break
        case .failure(_):
            print(myResponde.error!)
            break
        }
    }
    
    }
    
    
  }

