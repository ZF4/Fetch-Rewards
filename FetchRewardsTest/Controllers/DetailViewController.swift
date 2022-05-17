//
//  DetailTableViewController.swift
//  FetchRewardsTest
//
//  Created by Zachary Farmer on 5/10/22.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var id: String = ""
    var dessertDetails = [MealDetails]()
    var ingredients = [Ingredient]()


    
    //UI Oulets (Image, Dessert Name, Instructions, Ingredents)
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var instructionsText: UITextView!
    @IBOutlet weak var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        getApiDetailData { [self] in
            print("data loaded")
            self.view.reloadInputViews()
            
            //Put data into ingredients
            self.ingredients = self.dessertDetails[0].createIngredients()
            
            //Am I getting ingredients?
            print(self.ingredients)
            
            //styling
            let myColor : UIColor = UIColor.black
            instructionsText.layer.borderColor = myColor.cgColor
            instructionsText.layer.borderWidth = 1.0
            
            //Now reload table view so ingredients will have a count
            self.detailTableView.reloadData()
            //Assign dessert name to text
            self.nameLabel.text = self.dessertDetails[0].name
            //Assign dessert instructions to text
            self.instructionsText.text = self.dessertDetails[0].instructions

            //Set dessert image
            let urlString = (self.dessertDetails[0].image)
            let url = URL(string: urlString!)
            self.imageView.downloaded(from: url!)
            self.imageView.layer.borderColor = myColor.cgColor
            self.imageView.layer.borderWidth = 1.0

        }
        detailTableView.delegate = self
        detailTableView.dataSource = self
    }
    //Setting number of rows based off number of ingredients returned
    func tableView(_ detailTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    //Insert ingredients and measurments into each cell
    func tableView(_ detailTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(ingredients[indexPath.row].name!) | \(ingredients[indexPath.row].measure!)"
        return cell
    }
    
    
        //Get data from API, store it into jsonData, then dessertDetails
        func getApiDetailData(completed: @escaping () -> ()) {
            let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if error == nil {
                    do {
                        let jsonData = try JSONDecoder().decode(RootData.self, from: data!)
                        self.dessertDetails = jsonData.meals
                        //Check to see if mealDetails is returning data
                        print(" Testing data on detail view - \(self.dessertDetails)")
                        
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

//Loads Image
extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
