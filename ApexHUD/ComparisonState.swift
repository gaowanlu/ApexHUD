//
//  ComparisonState.swift
//  ApexHUD
//
//  Created by gaowanlu on 2026/7/19.
//


//
//  ComparisonState.swift
//  MeetXCode
//
//  Created by gaowanlu on 2026/7/19.
//


import Foundation
import CoreLocation
import SwiftUI

// 离线状态枚举（用于海拔对比）
enum ComparisonState {
    case none, person, building, mountain, cloud, airplane
    
    var iconName: String {
        switch self {
        case .none: return "antenna.radiowaves.left.and.right"
        case .person: return "figure.wave"
        case .building: return "building.2.fill"
        case .mountain: return "mountain.2.fill"
        case .cloud: return "cloud.sun.fill"
        case .airplane: return "airplane"
        }
    }
    
    var description: String {
        switch self {
        case .none: return "系统初始化中..."
        case .person: return "地面高度"
        case .building: return "城市上空"
        case .mountain: return "高空山脉"
        case .cloud: return "云层之上"
        case .airplane: return "平流层巡航"
        }
    }
}

@Observable
class OfflineSensorViewModel: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    // --- 海拔与坐标数据 ---
    var altitude: Double = 0.0
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var comparisonState: ComparisonState = .none
    
    // --- 指南针数据 ---
    var heading: Double = 0.0 // 0.0 - 360.0 (正北为0)
    var headingText: String = "N"
    
    override init() {
        super.init()
        setupSensors()
    }
    
    private func setupSensors() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation // 最高精度
        
        // 请求权限
        locationManager.requestWhenInUseAuthorization()
        
        // 开启位置更新 (海拔 & 经纬度)
        locationManager.startUpdatingLocation()
        
        // 开启磁力计更新 (指南针)
        if CLLocationManager.headingAvailable() {
            locationManager.startUpdatingHeading()
        }
    }
    
    // MARK: - 位置更新 (海拔 & 经纬度)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        DispatchQueue.main.async {
            self.altitude = location.altitude
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude
            
            // 离线更新海拔状态
            withAnimation(.spring()) {
                self.updateAltitudeState(for: location.altitude)
            }
        }
    }
    
    // MARK: - 指南针更新 (完全离线)
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        // 使用 trueHeading (真北)，如果无效则回退到 magneticHeading (磁北)
        let currentHeading = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading
        
        DispatchQueue.main.async {
            self.heading = currentHeading
            self.updateHeadingText(currentHeading)
        }
    }
    
    // MARK: - 辅助逻辑
    
    private func updateAltitudeState(for altitude: Double) {
        if altitude < 0 { self.comparisonState = .none }
        else if altitude < 2.0 { self.comparisonState = .person }
        else if altitude < 300.0 { self.comparisonState = .building }
        else if altitude < 1000.0 { self.comparisonState = .mountain }
        else if altitude < 4000.0 { self.comparisonState = .cloud }
        else { self.comparisonState = .airplane }
    }
    
    private func updateHeadingText(_ degrees: Double) {
        switch degrees {
        case 337.5...360, 0...22.5: self.headingText = "N"
        case 22.5..<67.5: self.headingText = "NE"
        case 67.5..<112.5: self.headingText = "E"
        case 112.5..<157.5: self.headingText = "SE"
        case 157.5..<202.5: self.headingText = "S"
        case 202.5..<247.5: self.headingText = "SW"
        case 247.5..<292.5: self.headingText = "W"
        case 292.5..<337.5: self.headingText = "NW"
        default: self.headingText = "-"
        }
    }
}
