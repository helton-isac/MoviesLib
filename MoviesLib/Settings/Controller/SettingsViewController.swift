//
//  SettingsViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 26/09/20.
//  Copyright © 2020 FIAP. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var switchAutoPLay: UISwitch!
    @IBOutlet var segmentedControlColors: UISegmentedControl!
    
    @IBOutlet var textFieldCategory: UITextField!
    
    // MARK: - Properties
    
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - IBActions
    @IBAction func autoPlayChanged(_ sender: UISwitch) {
    }
    @IBAction func colorChanged(_ sender: UISegmentedControl) {
    }
    
    @IBAction func categoryChanged(_ sender: UITextField) {
    }
    
    // MARK: - Methods
    
    
}
