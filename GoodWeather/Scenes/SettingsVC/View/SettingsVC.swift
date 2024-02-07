//
//  SettingsVC.swift
//  GoodWeather
//
//  Created by 2B on 31/12/2023.
//

import UIKit

class SettingsVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tempratureFormateTableView: UITableView!
    
    //MARK: - Variables
    
    var settingsViewModel = SettingsViewModel()
    var delegate : SettingsDone!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        setupTableView()
        setupNavigationController()
    }
    
    func setupTableView(){
        tempratureFormateTableView.delegate = self
        tempratureFormateTableView.dataSource = self
        tempratureFormateTableView.register(UINib(nibName: WeatherTableViewCell.ID, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.ID)
    }
    
    func setupNavigationController(){
        title = "Settings"
        navigationController?.navigationItem.hidesBackButton = true
        self.navigationItem.largeTitleDisplayMode = .never
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        leftBarBtnItem()
    }
    
    private func leftBarBtnItem(){
        let leftBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(addNewCity))
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func addNewCity(){
        delegate.settingsChanged(unit: Defaults.selectedUnit)
        navigationController?.popViewController(animated: true)
    }
}

extension SettingsVC : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsViewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.ID) as! WeatherTableViewCell
        let unit = settingsViewModel.unit[indexPath.row]
        cell.configureCell(unit :unit , tableview : tableView , indexPath : indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = settingsViewModel.unit[indexPath.row]
            Defaults.selectedUnit = unit
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}

extension SettingsVC : UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
