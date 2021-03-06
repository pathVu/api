//
//  MapSettings.swift
//  Access Path
//
//  Created by Nick Sinagra on 6/28/18.
//  Copyright © 2018 pathVu. All rights reserved.
//

import UIKit

/**
 * Allows users to choose which map layers will appear on the map.
 */
class MainSettingsMap:UIViewController {
    
    
    //UI Outlets
    @IBOutlet weak var curbRampsButton: UIButton!
    @IBOutlet weak var transitStopsButton: UIButton!
    @IBOutlet weak var curbRampsCheckmark: UIImageView!
    @IBOutlet weak var transitStopsCheckmark: UIImageView!
    @IBOutlet weak var crowdSourceButton: UIButton!
    @IBOutlet weak var crowdSourceCheckmark: UIImageView!
    
    //Shared Preferences
    let prefs = UserDefaults.standard
    
    
    /**
     * Setup layers button selected and unselected
     *
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Basic styles for buttons
        curbRampsButton.layer.cornerRadius = 5
        transitStopsButton.layer.cornerRadius = 5
        crowdSourceButton.layer.cornerRadius = 5
        
        //Set style of button depending on if the setting is on or off
        if(prefs.bool(forKey: PrefKeys.curbRampsKey) == true) {
            curbRampsCheckmark.isHidden = false
            curbRampsButton.layer.backgroundColor = AppColors.selectedBackground.cgColor
            curbRampsButton.layer.borderColor = AppColors.selectedBorder.cgColor
        } else {
            curbRampsCheckmark.isHidden = true
            curbRampsButton.layer.backgroundColor = UIColor.white.cgColor
            curbRampsButton.layer.borderColor = AppColors.darkBlue.cgColor
        }
        
        if(prefs.bool(forKey: PrefKeys.transitStopsKey) == true) {
            transitStopsCheckmark.isHidden = false
            transitStopsButton.layer.backgroundColor = AppColors.selectedBackground.cgColor
            transitStopsButton.layer.borderColor = AppColors.selectedBorder.cgColor
        } else {
            transitStopsCheckmark.isHidden = true
            transitStopsButton.layer.backgroundColor = UIColor.white.cgColor
            transitStopsButton.layer.borderColor = AppColors.darkBlue.cgColor
        }
        
        if(prefs.bool(forKey: PrefKeys.crowdSourceKey) == true) {
            crowdSourceCheckmark.isHidden = false
            crowdSourceButton.layer.backgroundColor = AppColors.selectedBackground.cgColor
            crowdSourceButton.layer.borderColor = AppColors.selectedBorder.cgColor
        } else {
            crowdSourceCheckmark.isHidden = true
            crowdSourceButton.layer.backgroundColor = UIColor.white.cgColor
            crowdSourceButton.layer.borderColor = AppColors.darkBlue.cgColor
        }
        
    }
    
    //Turn curb ramp layer on or off
    @IBAction func curbRampsButtonPressed(_ sender: Any) {
        if(prefs.bool(forKey: PrefKeys.curbRampsKey) == true) {
            //Turn Off Layer
            curbRampsCheckmark.isHidden = true
            curbRampsButton.layer.backgroundColor = UIColor.white.cgColor
            curbRampsButton.layer.borderColor = AppColors.darkBlue.cgColor
            prefs.set(false, forKey: PrefKeys.curbRampsKey)
        } else {
            //Turn On Layer
            curbRampsCheckmark.isHidden = false
            curbRampsButton.layer.backgroundColor = AppColors.selectedBackground.cgColor
            curbRampsButton.layer.borderColor = AppColors.selectedBorder.cgColor
            prefs.set(true, forKey: PrefKeys.curbRampsKey)
        }
    }
    
    //Turn transit stop layer on or off
    @IBAction func transitStopsButtonPressed(_ sender: Any) {
        if(prefs.bool(forKey: PrefKeys.transitStopsKey) == true) {
            //Turn Off Layer
            transitStopsCheckmark.isHidden = true
            transitStopsButton.layer.backgroundColor = UIColor.white.cgColor
            transitStopsButton.layer.borderColor = AppColors.darkBlue.cgColor
            prefs.set(false, forKey: PrefKeys.transitStopsKey)
        } else {
            //Turn On Layer
            transitStopsCheckmark.isHidden = false
            transitStopsButton.layer.backgroundColor = AppColors.selectedBackground.cgColor
            transitStopsButton.layer.borderColor = AppColors.selectedBorder.cgColor
            prefs.set(true, forKey: PrefKeys.transitStopsKey)
        }
    }
    
    
    //Turn crowdsource layer on or off
    @IBAction func clickOnCrowdSourceLayer(_ sender: UIButton) {
        if(prefs.bool(forKey: PrefKeys.crowdSourceKey) == true) {
            //Turn Off Layer
            crowdSourceCheckmark.isHidden = true
            crowdSourceButton.layer.backgroundColor = UIColor.white.cgColor
            crowdSourceButton.layer.borderColor = AppColors.darkBlue.cgColor
            prefs.set(false, forKey: PrefKeys.crowdSourceKey)
        } else {
            //Turn On Layer
            crowdSourceCheckmark.isHidden = false
            crowdSourceButton.layer.backgroundColor = AppColors.selectedBackground.cgColor
            crowdSourceButton.layer.borderColor = AppColors.selectedBorder.cgColor
            prefs.set(true, forKey: PrefKeys.crowdSourceKey)
        }
    }
    
    
    //Go back to last previous screen
    @IBAction func dismissView(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
