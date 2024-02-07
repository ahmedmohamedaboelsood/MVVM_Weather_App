//
//  WeatherTableViewCell.swift
//  GoodWeather
//
//  Created by 2B on 01/01/2024.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var TempratureLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    //MARK: - Variables
    
    static let ID = String(describing: WeatherTableViewCell.self)
    
    //MARK: - Cell life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    
    func configureCell(vm : WeatherViewModel){
        TempratureLbl.text = vm.temp.formateToDegree()
        cityLbl.text = vm.city
    }
    
    func configureCell(unit: Unit , tableview : UITableView , indexPath :IndexPath){
        TempratureLbl.isHidden = true
        cityLbl.font = .boldSystemFont(ofSize: 15)
        cityLbl.text = unit.displayName
        self.selectionStyle = .none
        if let selectedUnit = Defaults.selectedUnit {
            if selectedUnit == unit{
                self.accessoryType = .checkmark
                tableview.selectRow(at: indexPath, animated: false, scrollPosition: UITableView.ScrollPosition.none)
            }
        }
    }
}
