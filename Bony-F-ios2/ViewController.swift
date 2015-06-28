//
//  ViewController.swift
//  Bony-F-ios2
//
//  Created by Artem Szubowicz on 28/06/15.
//  Copyright © 2015 MooFoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KTKLocationManagerDelegate {

    let locationManager : KTKLocationManager = KTKLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (KTKLocationManager.canMonitorBeacons())
        {
            let region : KTKRegion = KTKRegion();
            region.uuid = "f7826da6-4fa2-4e98-8024-bc5b71e0893e"; // kontakt.io proximity UUID
            
            self.locationManager.setRegions([region]);
            self.locationManager.delegate = self;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.locationManager.startMonitoringBeacons();
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.locationManager.stopMonitoringBeacons();
    }

    func locationManager(locationManager: KTKLocationManager!, didChangeState state: KTKLocationManagerState, withError error: NSError!) {}
    
    func locationManager(locationManager: KTKLocationManager!, didEnterRegion region: KTKRegion!) {}
    
    func locationManager(locationManager: KTKLocationManager!, didExitRegion region: KTKRegion!) {}
    
    func locationManager(locationManager: KTKLocationManager!, didRangeBeacons beacons: [AnyObject]!) {}
}

