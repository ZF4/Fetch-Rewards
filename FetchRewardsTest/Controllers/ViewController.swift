//
//  ViewController.swift
//  FetchRewardsTest
//
//  Created by Zachary Farmer on 5/10/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dessertList = [MealDetails]()
    var indexTapped: Int?
    
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getApiData {
            print("data loaded")
            //Reload table to populate cells
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
        }
    
    //Setting number of rows based off number of desserts returned
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dessertList.count
    }
    
    //Insert a dessert name into each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(dessertList[indexPath.row].name)"
        return cell

    }
    
    //Segue to new detail view, also set indexTapped to send the correct id
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexTapped = indexPath.row
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    //Assign id on detail view from the dessert tapped
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.id = dessertList[indexTapped!].id
        }
    }
    
    //Get data from API, store it into jsonData, then dessertList
    func getApiData(completed: @escaping () -> ()) {
        let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                do {
                    let jsonData = try JSONDecoder().decode(RootData.self, from: data!)
                    self.dessertList = jsonData.meals
                    print("Testing data on view controller - \(self.dessertList)")
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                }
                catch {
                    print(error)
                }
            }
        }.resume()
    }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
/*
"{
  "meals": [
    {
      "strMeal": "Apam balik",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
      "idMeal": "53049"
    },
    {
      "strMeal": "Apple & Blackberry Crumble",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
      "idMeal": "52893"
    },
    {
      "strMeal": "Apple Frangipan Tart",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg",
      "idMeal": "52768"
    },
    {
      "strMeal": "Bakewell tart",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
      "idMeal": "52767"
    },
    {
      "strMeal": "Banana Pancakes",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/sywswr1511383814.jpg",
      "idMeal": "52855"
    },
    {
      "strMeal": "Battenberg Cake",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/ywwrsp1511720277.jpg",
      "idMeal": "52894"
    },
    {
      "strMeal": "BeaverTails",
      "strMealThumb": "https://www.themealdb.com/images/media/meals/ryppsv1511815505.jpg",
      "idMeal": "52928"
    }]
}"
*/
