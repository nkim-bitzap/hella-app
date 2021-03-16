//
//  ViewControllerScreen102.swift
//  TestApp1
//
//  Created by Nikolai Kim on 15.03.21.
//

import UIKit
import AVFoundation

class ViewControllerScreen102: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var viewCamera: UIView!
    @IBOutlet weak var buttonScan: UIButton!

    enum ScanButtonState {
        case PRESSED
        case RELEASED
    }
    
    var buttonState = ScanButtonState.RELEASED
    var captureSession: AVCaptureSession!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!

    //**************************************************************************

    func updateButtonImage() {
        if (buttonState == ScanButtonState.PRESSED) {
        }
        else {
        }
    }

    //**************************************************************************

    @IBAction func buttonScanTouchDown(_ sender: Any) {
        buttonState = ScanButtonState.PRESSED
        updateButtonImage()
    }
    
    //**************************************************************************

    @IBAction func buttonScanTouchUpOutside(_ sender: Any) {
        buttonState = ScanButtonState.RELEASED
        updateButtonImage()
    }
    
    //**************************************************************************

    @IBAction func buttonScanTouchUpInside(_ sender: Any) {
        buttonState = ScanButtonState.RELEASED
        updateButtonImage()
    }

    //**************************************************************************
    // do any additional setup stuff after the view has become visible
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // initialize in order to setup the camera
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        
        // use the rear camera that is aligned with the lidar sensor
        let rearCam = AVCaptureDevice.default(for: AVMediaType.video)
        
        if (rearCam == nil) {
            let alert = UIAlertController(
                            title: "Camera error",
                            message: "Failed accessing rear camera",
                            preferredStyle: UIAlertController.Style.alert)

            alert.addAction(UIAlertAction(
                                title: "Ok",
                                style: UIAlertAction.Style.default,
                                handler: { _ in }))

            self.present(alert, animated: true, completion: nil)
            return
        }
    }
}
