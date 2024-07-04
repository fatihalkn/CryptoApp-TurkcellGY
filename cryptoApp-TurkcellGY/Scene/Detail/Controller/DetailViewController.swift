//
//  DetailViewController.swift
//  cryptoApp-TurkcellGY
//
//  Created by Fatih on 4.07.2024.
//

import Foundation
import UIKit
import DGCharts

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    let detailView = DetailView()
    let detailViewModel = DetailViewModel()
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeValue()
        configurePieChart()
        
    }
    
    func changeValue() {
        if let changeValue = Double(detailView.coinChangeLabel.text ?? "0.0") {
            if changeValue > 0 {
                detailView.coinChangeLabel.textColor = .green
            } else {
                detailView.coinChangeLabel.textColor = .red

            }
        }
    }
    
    func configurePieChart() {
        var entries = [PieChartDataEntry]()
        
        for _ in 0..<5 {
            let value = Double.random(in: 1...10)
            entries.append(PieChartDataEntry(value: value))
        }
        
        let set = PieChartDataSet(entries: entries, label: "Pie Chart Data")
        set.colors = ChartColorTemplates.joyful()
        let data = PieChartData(dataSet: set)
        detailView.pieChard.data = nil
        detailView.pieChard.data = data
    }
    
    
}
