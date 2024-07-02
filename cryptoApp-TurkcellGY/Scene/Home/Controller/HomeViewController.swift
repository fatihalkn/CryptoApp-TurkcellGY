//
//  HomeViewController.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 2.07.2024.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    let homeView = HomeView()
    
    //MARK: - Life Cycle Methods
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
