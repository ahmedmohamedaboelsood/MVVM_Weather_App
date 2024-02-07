//
//  WeatherVC.swift
//  GoodWeather
//
//  Created by 2B on 31/12/2023.
//

import UIKit

class WeatherVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var weatherListTableView: UITableView!
    
    //MARK: - Variables
    
    var weatherViewModel = WeatherListViewModel()
    var settingsVM = SettingsViewModel()
    
    //MARK: - View lif cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.navigationItem.largeTitleDisplayMode = .always
            self?.navigationController?.navigationBar.sizeToFit()
        }
    }
    
    //MARK: - Methods
    
    private func setupUI(){
        setupNavigationController()
        setupTableView()
    }
    
    private func updateTempratureFormate( formate : Unit?){
        if let formate = formate {
            weatherViewModel.updateTemp(unit: formate)
            weatherListTableView.reloadData()
        }
    }
    
    private func setupTableView(){
        weatherListTableView.register(UINib(nibName: WeatherTableViewCell.ID, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.ID)
        weatherListTableView.delegate = self
        weatherListTableView.dataSource = self
    }
    
    private func setupNavigationController(){
        title = "Good Weather"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        rightBarBtnItem()
        leftBarBtnItem()
    }
    
    private func rightBarBtnItem(){
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewCity))
        navigationItem.rightBarButtonItem = rightBtn
    }
    
    private func leftBarBtnItem(){
        let leftBtn = UIBarButtonItem(title: "Settings", image: nil, target: self, action: #selector(openSettings))
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func addNewCity(){
        let vc = AddNewCityVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
                                      
    @objc func openSettings(){
        let vc = SettingsVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WeatherVC : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherViewModel.numberOfRows(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.ID) as! WeatherTableViewCell
        let cityWeather = weatherViewModel.modelOf(indexPath.row)
        cell.configureCell(vm: cityWeather)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension WeatherVC : AddNewCityDelegate{
    func addCityDidSaved(vm: WeatherViewModel) {
        weatherViewModel.addNewWeather(vm)
        weatherListTableView.reloadData()
    }
}

extension WeatherVC : SettingsDone {
    func settingsChanged(unit: Unit?) {
        updateTempratureFormate(formate: unit)
    }
}
