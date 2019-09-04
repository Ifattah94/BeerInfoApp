//
//  ViewController.swift
//  BeerInfoApp
//
//  Created by C4Q on 9/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var beerArr = [Beer]() {
        didSet {
            beerTableView.reloadData()
        }
    }
    
    @IBOutlet weak var beerTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        beerTableView.dataSource = self
        beerTableView.delegate = self
        loadData()
        
    }
    
    private func loadData() {
        BeerAPIManager.shared.getBeer { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let beerArrFromOnline):
                    self.beerArr = beerArrFromOnline
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let beerCell = beerTableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as! BeerCell
        
        let thisBeer = beerArr[indexPath.row]
        beerCell.nameLabel.text = thisBeer.name
        beerCell.taglineLabel.text = thisBeer.tagline
        
        
        ImageHelper.shared.getImage(urlStr: thisBeer.imageURL) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    beerCell.beerImageView.image = imageFromOnline
                }
            }
            
        }
        
        
        return beerCell
    }
    


}

