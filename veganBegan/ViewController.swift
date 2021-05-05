import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, MTMapViewDelegate {
 //   @IBOutlet var mapView: MTMapView?
    var mapView: MTMapView?
    var mapPoint: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView = MTMapView(frame: self.view.bounds)
        
        if let mapView = mapView{
            mapView.delegate = self
            mapView.baseMapType = .standard
            
            mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude:37.573083, longitude: 126.983168)), zoomLevel: 4, animated: true)
           
            mapView.showCurrentLocationMarker = true
            mapView.currentLocationTrackingMode = .onWithoutHeading
            
            self.mapPoint = MTMapPoint(geoCoord: MTMapPointGeo(latitude:37.573883, longitude: 126.983168))
            
            poiItem1 = MTMapPOIItem()
            poiItem1?.markerType = MTMapPOIItemMarkerType.redPin
            poiItem1?.mapPoint = mapPoint
            poiItem1?.itemName = "veganBegan!"
           
            mapView.add(poiItem1)
       
            self.view.addSubview(mapView)
            
        }
    }
    
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy){
        let currentLocation = location?.mapPointGeo()
        if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude{ print("MTMapView update Current Location (\(latitude), \(longitude))")}
            
        }
    
    func mapView(_ mapView: MTMapView?, updateDeviceHeading headingAngle: MTMapRotationAngle) {
        print("MTMapView update Device Heading (\(headingAngle)) degrees")
    }
}
