import UIKit
import MapKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var mapView2: MKMapView!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var dateField: UITextField!
    let timePicker = UIDatePicker()
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var timeLabel1: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        setTime()
    }
    
    //Functions
  
    func setTime(){
        let time = Foundation.Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm:ss"
        
        timeField.text = formatter.string(from: time)
        timeField.textColor = .link
        timeField.inputAccessoryView = createToolBar1()
        timeField.inputView = timePicker
        
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .compact
        timePicker.frame = CGRect(x: 60, y: 70, width: 0, height: 100)
    }
    
    func createToolBar1() -> UIToolbar{
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(timePickerValueChanged(sender: )))
        toolBar.setItems([doneButton], animated: true)
        
        return toolBar
    }
    
    @objc func timePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_gb")
        formatter.dateFormat = "HH:mm:ss"
        self.timeField.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    func createToolBar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        
        dateField.textAlignment = .left
        dateField.inputView = datePicker
        dateField.inputAccessoryView = createToolBar()
    }
    
    @objc func donePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.dateField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
//
}



//Attempted to get the result of the first rendered screen to this view controller but failed to do so

//import MapKit
//import CoreLocation
//var destinationCoordinates: CLLocationCoordinate2D?
//
//    @IBOutlet weak var mapView: MKMapView!
//    let locationManager = CLLocationManager()
//
//    override func viewDidLoad() {
//            super.viewDidLoad()
//
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.requestWhenInUseAuthorization()
//        }
//
//    override func viewDidAppear(_ animated: Bool) {
//            super.viewDidAppear(animated)
//
//            if let destinationCoordinates = destinationCoordinates {
//                mapRoute(destinationCoordinates)
//            }
//        }
//
//    func mapRoute(_ destinationCord: CLLocationCoordinate2D) {
//            guard let userLocation = locationManager.location?.coordinate else {
//                print("Location Not Found")
//                return
//            }
//
//            let soucePlaceMark = MKPlacemark(coordinate: userLocation)
//            let destPlaceMark = MKPlacemark(coordinate: destinationCord)
//            let sourceItem = MKMapItem(placemark: soucePlaceMark)
//            let destItem = MKMapItem(placemark: destPlaceMark)
//            let destinationRequest = MKDirections.Request()
//            destinationRequest.source = sourceItem
//            destinationRequest.destination = destItem
//            destinationRequest.transportType = .automobile
//            destinationRequest.requestsAlternateRoutes = true
//            let directions = MKDirections(request: destinationRequest)
//            directions.calculate { [weak self] (response, error) in
//                guard let self = self, let response = response else {
//                    if let error = error {
//                        print("Something Went Wrong: \(error)")
//                    }
//                    return
//                }
//
//                // Clear any previous overlays and annotations
//                self.mapView.removeOverlays(self.mapView.overlays)
//                self.mapView.removeAnnotations(self.mapView.annotations)
//
//                let route = response.routes[0]
//                self.mapView.addOverlay(route.polyline)
//
//                let padding: CGFloat = 20.0
//                let mapRect = route.polyline.boundingMapRect
//                let zoomRect = MKMapRect(
//                    x: mapRect.origin.x - padding,
//                    y: mapRect.origin.y - padding,
//                    width: mapRect.size.width + 2 * padding,
//                    height: mapRect.size.height + 2 * padding
//                )
//                self.mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
//
//                let destinationAnnotation = MKPointAnnotation()
//                destinationAnnotation.coordinate = destinationCord
//                self.mapView.addAnnotation(destinationAnnotation)
//            }
//        }
//    }
//
//extension secondViewController: MKMapViewDelegate {
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        if overlay is MKPolyline {
//            let renderer = MKPolylineRenderer(overlay: overlay)
//            renderer.strokeColor = .blue
//            return renderer
//        }
//        return MKOverlayRenderer(overlay: overlay)
//    }
//}
//
//extension secondViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Location Manager Error: \(error.localizedDescription)")
//    }
