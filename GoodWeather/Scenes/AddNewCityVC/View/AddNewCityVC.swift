//
//  AddNewCityVC.swift
//  GoodWeather
//
//  Created by 2B on 31/12/2023.
//

import UIKit

class AddNewCityVC: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var addCityBtn: UIButton!
    @IBOutlet weak var cityTxtField: UITextField!
    
    //MARK: - Variables
    
    var addCityViewModel = AddNewCityViewModel()
    var delegate : AddNewCityDelegate?
    
    //MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New City"
        navigationItem.hidesBackButton = true
        navigationItem.largeTitleDisplayMode = .never
        leftBarBtnItem()
    }
    
    private func leftBarBtnItem(){
        let leftBtn = UIBarButtonItem(title: "< Back", style: .done, target: self, action: #selector(addNewCity))
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func addNewCity(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - IBActions
    
    @IBAction func addCityBtn(_ sender: UIButton) {
        addCityViewModel.getNewCityTemprature(city: cityTxtField.text){[weak self] viewModel in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.delegate?.addCityDidSaved(vm: viewModel)
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
