//
//  SettingsViewController.swift
//  MoviesLib
//
//  Created by Helton Isac Torres Galindo on 26/09/20.
//
import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var switchAutoplay: UISwitch!
    @IBOutlet weak var segmentedControlColors: UISegmentedControl!
    @IBOutlet weak var textFieldCategory: UITextField!
    
    // MARK: - Properties
    private let ud = UserDefaults.standard
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func autoplayChanged(_ sender: UISwitch) {
        ud.set(sender.isOn, forKey: "autoplay")
    }
    
    @IBAction func colorChanged(_ sender: UISegmentedControl) {
        ud.set(sender.selectedSegmentIndex, forKey: "color")
    }
    
    @IBAction func categoryChanged(_ sender: UITextField) {
        ud.set(sender.text!, forKey: "category")
        sender.resignFirstResponder()
    }
    
    // MARK: - Methods
    private func setupView() {
        let autoplay = ud.bool(forKey: "autoplay")
        switchAutoplay.isOn = autoplay
        
        let colorIndex = ud.integer(forKey: "color")
        segmentedControlColors.selectedSegmentIndex = colorIndex
        
        let category = ud.string(forKey: "category")
        textFieldCategory.text = category
    }
}
