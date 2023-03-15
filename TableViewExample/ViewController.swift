//
//  ViewController.swift
//  TableViewExample
//
//  Created by Andy on 14/03/2023.
//

import UIKit

class ViewController: UIViewController {
    
    enum Item {
        case movie(String)
        case color(UIColor)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var allItemsApi: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getAllItems { allItemsFromApi in
            // Cái block này sẽ để chờ API gọi xong
            // Lấy đc dữ liệu thành 1 mảng thì gọi gọi block([mảng vừa lấy truyền vào đây])
            self.allItemsApi = allItemsFromApi
        }
    }
    
    func setupTableView() {
        let nibcell = UINib(nibName: "ColorTableViewCell", bundle: nil)
        tableView.register(nibcell, forCellReuseIdentifier: "ColorTableViewCell")
        
        // setup row height
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
    }
     
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = allItemsApi[indexPath.row]
        switch item {
        case .movie(let movieDescription):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as? MovieTableViewCell else {
                return .init()
            }

            cell.movieDescriptionLabel.text = movieDescription
            return cell
            
        case .color(let color):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as? ColorTableViewCell else {
                return .init()
            }
            cell.ColorView.backgroundColor = color
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItemsApi.count
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}













































extension ViewController {
    func getAllItems(completion: @escaping ([Item]) -> Void) {
        print("START")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let allItemsFromApi: [Item] = [
                .movie("Submitted by Penelope on Mon, 03/06/2023 - 05:23"),
                .movie("Submitted by mmmmm on Wed, 12/28/2022 - 10:52"),
                .color(.yellow),
                .color(.green),
                .movie("Submitted by FandF_isagi on Mon, 03/06/2023 - 05:25"),
                .color(.blue),
                .movie("OK TamBi"),
                .movie("Submitted by shinta on Mon, 10/17/2022 - 15:20"),
                .color(.black)
            ]
            
            
            completion(allItemsFromApi)
        }
    }
}
