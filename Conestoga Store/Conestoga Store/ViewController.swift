//
//  ViewController.swift
//  Conestoga Store
//
//  Created by user228347 on 6/23/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var products: [Product] = [
        Product(title: "IBM Tablet", description: "Sutudent#", price: 999.00),
        Product(title: "Dell", description: " 2.7Ghz", price: 1299.99),
        Product(title: "Apple", description: "2Ghz", price: 2299.99),
        Product(title: "HP", description: "2.3Ghz", price: 299.99)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnMonitor(_ sender: Any) {
        print(" Monitor ")
    }
    
    
    @IBAction func btnAdd(_ sender: Any) {
        let alert = UIAlertController(title: "Add a new product", message: "Fill in the fields below with the product details.", preferredStyle: .alert)
                
                alert.addTextField { field in
                    field.placeholder = "Title"
                    field.returnKeyType = .next
                }
        
                alert.addTextField { field in
                    field.placeholder = "Description"
                    field.returnKeyType = .next
                }
                
                alert.addTextField { field in
                    field.placeholder = "Price"
                    field.returnKeyType = .next
                }
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {_ in
                    guard let fields = alert.textFields, fields.count == 3 else {
                        return
                    }
                    let productTitle = fields[0]
                    let productDescription = fields[1]
                    let productPrice = fields[2]
                    
                    guard let title = productTitle.text, !title.isEmpty else {
                        return
                    }
                    
                    guard let description = productDescription.text, !description.isEmpty else {
                        return
                    }
                    
                    guard let price = productPrice.text, !price.isEmpty else {
                        return
                    }

                    let doublePrice = Double(price) ?? 0.0
                    
                    self.products.append(Product(title: title, description: description, price: doublePrice))
                    self.tableView.reloadData()
                    
                   
                }))
                
                present(alert, animated: true)
    }
    

}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        
        let product:Product = products[indexPath.row]
        cell.set(title: product.title, description: product.description, price: product.price)
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
}
