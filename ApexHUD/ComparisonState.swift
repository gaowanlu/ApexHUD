import Foundation
import CoreLocation
import SwiftUI

// MARK: - ComparisonState

/// Represents a single altitude milestone analogy
public struct AltitudeAnalogy: Equatable {
    public let title: String
    public let description: String
    public let iconName: String
    public let color: Color
}

/// The current altitude state in the ViewModel
public enum ComparisonState: Equatable {
    case none
    case analogy(AltitudeAnalogy)
}

// MARK: - Mountain Models

/// 山峰数据模型
public struct Mountain: Identifiable {
    public let id = UUID()
    let name: String
    let height: Double
    let location: String
    let range: String
    let summary: String
    let details: String
    let iconName: String

    var heightCategory: String {
        if height < 1000 {
            return "低山"
        } else if height < 3000 {
            return "中山"
        } else if height < 6000 {
            return "高山"
        } else {
            return "极高山"
        }
    }
}

/// 山峰状态
public struct MountainState {
    let mountain: Mountain
    let altitudeDifference: Double
    let currentAltitude: Double

    var description: String {
        if altitudeDifference > 0 {
            return "比\(mountain.name)低\(String(format: "%.0f", abs(altitudeDifference)))米"
        } else if altitudeDifference < 0 {
            return "超过\(mountain.name)\(String(format: "%.0f", abs(altitudeDifference)))米"
        } else {
            return "与\(mountain.name)同海拔"
        }
    }

    var heightDescription: String {
        let percentage = (currentAltitude / mountain.height) * 100
        return "当前海拔占山峰高度的\(String(format: "%.1f", percentage))%"
    }

    var isHigher: Bool {
        currentAltitude > mountain.height
    }
}

// MARK: - HUD Models

/// HUD 离线状态模型 (用于 UI 层)
public struct HUDComparisonState: Equatable {
    public let title: String
    public let description: String
    public let iconName: String
    public let color: Color

    public static let none = HUDComparisonState(
        title: "等待定位...",
        description: "",
        iconName: "antenna.radiowaves.left.and.right",
        color: .gray
    )
}

/// HUD 山峰
public struct HUDMountain: Identifiable {
    public let id = UUID()
    let name: String
    let height: Double
    let location: String
    let range: String
    let summary: String
    let details: String
    let iconName: String

    var heightCategory: String {
        if height < 1000 {
            return "低山"
        } else if height < 3000 {
            return "中山"
        } else if height < 6000 {
            return "高山"
        } else {
            return "极高山"
        }
    }
}

/// HUD 山峰状态
public struct HUDMountainState {
    let mountain: HUDMountain
    let altitudeDifference: Double
    let currentAltitude: Double

    var description: String {
        if altitudeDifference > 0 {
            return "比\(mountain.name)低\(String(format: "%.0f", abs(altitudeDifference)))米"
        } else if altitudeDifference < 0 {
            return "超过\(mountain.name)\(String(format: "%.0f", abs(altitudeDifference)))米"
        } else {
            return "与\(mountain.name)同海拔"
        }
    }
}

// MARK: - Conversion Functions

public func convertComparisonState(_ state: ComparisonState) -> HUDComparisonState {
    switch state {
    case .none:
        return .none
    case .analogy(let analogy):
        return HUDComparisonState(
            title: analogy.title,
            description: analogy.description,
            iconName: analogy.iconName,
            color: analogy.color
        )
    }
}

public func convertMountainState(_ state: MountainState) -> HUDMountainState {
    HUDMountainState(
        mountain: HUDMountain(
            name: state.mountain.name,
            height: state.mountain.height,
            location: state.mountain.location,
            range: state.mountain.range,
            summary: state.mountain.summary,
            details: state.mountain.details,
            iconName: state.mountain.iconName
        ),
        altitudeDifference: state.altitudeDifference,
        currentAltitude: state.currentAltitude
    )
}

// MARK: - Database & Helpers

/// 预设的海拔类比里程碑
internal let altitudeMilestoneRanges: [(min: Double, max: Double, analogy: AltitudeAnalogy)] = [
    (-Double.infinity, -0.001, AltitudeAnalogy(title: "海平面以下", description: "正在深海或低洼地带探索", iconName: "water.waves", color: .blue)),
    (0.0, 10.0, AltitudeAnalogy(title: "地面高度", description: "就在脚下，感受大地的厚度", iconName: "figure.walk", color: .green)),
    (10.0, 100.0, AltitudeAnalogy(title: "低空掠过", description: "正在穿过树丛或低矮建筑", iconName: "tree.fill", color: .green)),
    (100.0, 500.0, AltitudeAnalogy(title: "城市高度", description: "在摩天大楼之间穿梭", iconName: "building.2.fill", color: .blue)),
    (500.0, 2000.0, AltitudeAnalogy(title: "山麓地带", description: "正在接近山脉的脚下", iconName: "mountain.2.fill", color: .orange)),
    (2000.0, 4000.0, AltitudeAnalogy(title: "高山巡航", description: "进入了真正的山岳世界", iconName: "mountain.fill", color: .orange)),
    (4000.0, 6000.0, AltitudeAnalogy(title: "雪线之上", description: "踏入了终年积雪的高海拔区", iconName: "snowflake", color: .blue)),
    (6000.0, 8000.0, AltitudeAnalogy(title: "极限高度", description: "挑战生命极限的高空", iconName: "wind", color: .indigo)),
    (8000.0, 8848.0, AltitudeAnalogy(title: "珠峰之巅", description: "正在冲刺世界之巅", iconName: "mountain.3.fill", color: .red)),
    (8848.0, 10000.0, AltitudeAnalogy(title: "平流层边缘", description: "越过珠峰，进入飞行高度", iconName: "airplane", color: .blue)),
    (10000.0, 15000.0, AltitudeAnalogy(title: "高空巡航", description: "飞机常见的巡航高度", iconName: "airplane", color: .blue)),
    (15000.0, 20000.0, AltitudeAnalogy(title: "高空极境", description: "稀薄的大气，接近太空", iconName: "cloud.fill", color: .indigo)),
    (20000.0, Double.infinity, AltitudeAnalogy(title: "近太空", description: "接近大气层的边缘", iconName: "rocket", color: .purple))
]

let mountainDatabase: [Mountain] = [
    Mountain(name: "玉山北峰", height: 3952, location: "台湾", range: "玉山山脉", summary: "台湾第二高峰，冬季积雪期短", details: "玉山北峰海拔3952米，是台湾第二高峰。山体主要由白岗 granite 组成，冬季有短暂积雪。可从嘉义阿里山国家森林游乐区登山口进入，需申请入山证。", iconName: "mountain.2.fill"),
    Mountain(name: "富士山", height: 3776, location: "日本本州", range: "富士火山带", summary: "日本最高峰，世界文化遗产", details: "富士山海拔3776米，是日本的象征和最高峰。作为活火山，最后一次喷发是1707年。每年7-8月开放登山，每年吸引超过30万登山者。2013年被列入世界文化遗产。", iconName: "mountain.2.fill"),
    Mountain(name: "衡山祝融峰", height: 1300, location: "中国湖南", range: "南岳衡山", summary: "南岳最高峰，历史文化名山", details: "祝融峰海拔1300米，是南岳衡山的最高峰。因纪念火神祝融而得名。山中有多处古迹，包括祝融殿、望日台等。春季多云雾，夏季凉爽，是避暑胜地。", iconName: "mountain.2.fill"),
    Mountain(name: "黄山莲花峰", height: 1864, location: "中国安徽", range: "黄山山脉", summary: "黄山三大主峰之一，峻峭奇伟", details: "莲花峰海拔1864米，是黄山三大主峰中最高峰。峰顶平面面积约100平方米，四周悬崖峭壁。以奇松、怪石、云海、温泉四绝著称，四季皆宜游览。", iconName: "mountain.2.fill"),
    Mountain(name: "泰山玉皇顶", height: 1545, location: "中国山东", range: "泰山山脉", summary: "五岳之首，帝王封禅之地", details: "玉皇顶海拔1545米，是泰山的主峰。自古有天下第一山之称，历代帝王多有封禅。山顶有玉皇庙、日观峰等古迹。以重于泰山的厚重文化内涵闻名。", iconName: "building.2.fill"),
    Mountain(name: "峨眉山金顶", height: 3079, location: "中国四川", range: "大峨山", summary: "四大佛教名山之一，云海奇观", details: "金顶海拔3079米，是峨眉山的最高峰。以佛光、云海、日出、圣灯四绝闻名。常有藏酋猴出没，需注意安全。", iconName: "mountain.2.fill"),
    Mountain(name: "贡嘎山主峰", height: 7556, location: "中国四川", range: "大雪山脉", summary: "蜀山之王，登山者圣地", details: "贡嘎山海拔7556米，是四川最高峰，有蜀山之王之称。山体呈金字塔形，终年积雪。气候多变，冰川发育完整。是专业登山者向往的圣地，但攀登难度极高。", iconName: "mountain.2.fill"),
    Mountain(name: "四姑娘山幺妹峰", height: 6250, location: "中国四川", range: "邛崃山脉", summary: "东方的阿尔卑斯，女性登山者偶像", details: "幺妹峰海拔6250米，是四姑娘山的最高峰。四峰并立，幺妹最秀美，被誉为东方的阿尔卑斯。山脚有木骡子、打弓等高山草甸，夏季野花遍野。", iconName: "mountain.2.fill"),
    Mountain(name: "玉珠峰", height: 6178, location: "中国青海", range: "昆仑山脉", summary: "昆仑东口第一峰，大众登山首选", details: "玉珠峰海拔6178米，位于昆仑山东段。山体南北坡冰川发育完整，是典型的海洋型冰川。因其海拔适中、路线简单，是许多登山者的第一座6000米级山峰。", iconName: "mountain.2.fill"),
    Mountain(name: "慕士塔格峰", height: 7546, location: "中国新疆", range: "喀喇昆仑山脉", summary: "冰川之父，金字塔形状完美", details: "慕士塔格峰海拔7546米，意为冰川之父。山体呈完美的金字塔形，三面陡峭。气候恶劣，雪崩频繁。是技术型山峰，需要良好的高海拔攀登经验。", iconName: "mountain.2.fill"),
    Mountain(name: "勃朗峰", height: 4810, location: "法国/意大利边境", range: "阿尔卑斯山脉", summary: "欧洲最高峰，登山运动发源地", details: "勃朗峰海拔4810米，是阿尔卑斯山脉的最高峰，也是欧洲最高峰。1786年首次登顶，标志着现代登山运动的开始。可乘坐缆车至3800米处，再徒步登顶。", iconName: "mountain.2.fill"),
    Mountain(name: "希格峰", height: 8167, location: "尼泊尔/中国边境", range: "喜马拉雅山脉", summary: "世界第15高峰，技术型山峰", details: "希格峰海拔8167米，是世界第15高峰。山形陡峭，被称为影子峰。1988年中国登山队首次登顶。攀登路线复杂，需穿越狭窄的山脊，适合有经验的高山登山者。", iconName: "mountain.3.fill"),
    Mountain(name: "卓奥友峰", height: 8188, location: "中国/尼泊尔边境", range: "喜马拉雅山脉", summary: "世界第6高峰，相对易登的8000米级山峰", details: "卓奥友峰海拔8188米，是世界第6高峰。山势平缓，路线简单，是唯一可以从北坡常规攀登的8000米级山峰。1954年奥地利登山者首次登顶。", iconName: "mountain.3.fill"),
    Mountain(name: "洛子峰", height: 8516, location: "中国/尼泊尔边境", range: "喜马拉雅山脉", summary: "世界第4高峰，珠峰的兄弟峰", details: "洛子峰海拔8516米，是世界第4高峰，与珠穆朗玛峰相距仅2公里。山体陡峭，四壁都是悬崖，被称为酷峰。1956年瑞士登山队首次登顶。", iconName: "mountain.3.fill"),
    Mountain(name: "马卡鲁峰", height: 8485, location: "中国/尼泊尔边境", range: "喜马拉雅山脉", summary: "世界第5高峰，金字塔形山体", details: "马卡鲁峰海拔8485米，是世界第5高峰。山体呈金字塔形，四壁陡峭。1955年法国登山队首次登顶。攀登路线长，需时约40天。", iconName: "mountain.3.fill"),
    Mountain(name: "珠穆朗玛峰", height: 8848, location: "中国/尼泊尔边境", range: "喜马拉雅山脉", summary: "世界最高峰，地球之巅", details: "珠穆朗玛峰海拔8848米，是世界最高峰，位于中国与尼泊尔边境。藏语意为大地之母，尼泊尔语意为女神之颠。1953年希拉里和丹增首次从南坡登顶。1960年中国人首次从北坡登顶。", iconName: "mountain.3.fill"),
    Mountain(name: "乔戈里峰", height: 8611, location: "中国/巴基斯坦边境", range: "喀喇昆仑山脉", summary: "死亡之峰", details: "乔戈里峰海拔8611米，是世界第2高峰，意为高大的山峰。死亡率极高，有死亡之峰之称。气候恶劣，雪崩频繁。1954年意大利登山队首次登顶。", iconName: "mountain.3.fill"),
    Mountain(name: "干城章嘉峰", height: 8586, location: "印度/尼泊尔边境", range: "喜马拉雅山脉", summary: "世界第3高峰，五座峰顶组成", details: "干城章嘉峰海拔8586米，是世界第3高峰。名字意为雪之五宫，因山体有五个峰顶而得名。1955年英国登山队首次登顶。", iconName: "mountain.3.fill"),
    Mountain(name: "洛子峰南壁", height: 8495, location: "中国/尼泊尔边境", range: "喜马拉雅山脉", summary: "世界未独立登顶的最高山峰", details: "洛子峰南壁海拔8495米，长期以来被视为洛子峰的一部分。山壁陡峭，路线复杂。2001年才被确认为独立山峰。", iconName: "mountain.3.fill")
]

func findClosestMountain(for altitude: Double) -> Mountain? {
    guard altitude > 0 else { return nil }
    let filteredMountains = mountainDatabase.filter { $0.height >= altitude * 0.8 }
    if filteredMountains.isEmpty {
        return mountainDatabase.max(by: { $0.height < $1.height })
    }
    let closest = filteredMountains.min { abs($0.height - altitude) < abs($1.height - altitude) }
    return closest
}

func getMountainHeightRange() -> (min: Double, max: Double) {
    let heights = mountainDatabase.map { $0.height }
    return (heights.min() ?? 0, heights.max() ?? 0)
}

// MARK: - OfflineSensorViewModel

@Observable
public class OfflineSensorViewModel: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    // --- 海拔与坐标数据 ---
    public var altitude: Double = 0.0
    public var latitude: Double = 0.0
    public var longitude: Double = 0.0
    public var comparisonState: ComparisonState = .none
    public var mountainState: MountainState?
    public var isDebugging: Bool = false

    // --- 指南针数据 ---
    public var heading: Double = 0.0 // 0.0 - 360.0 (正北为0)
    public var headingText: String = "N"

    private var smoothedHeading: Double?

    public override init() {
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

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }

        DispatchQueue.main.async {
            if self.isDebugging { return }
            self.altitude = location.altitude
            self.latitude = location.coordinate.latitude
            self.longitude = location.coordinate.longitude

            // 离线更新海拔状态
            self.updateAltitudeState(for: location.altitude)
        }
    }

    // MARK: - 调试工具

    public func debugSetAltitude(_ altitude: Double) {
        DispatchQueue.main.async {
            self.altitude = altitude
            self.updateAltitudeState(for: altitude)
        }
    }

    // MARK: - 指南针更新 (完全离线)

    public func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        // 使用 trueHeading (真北)，如果无效则回退到 magneticHeading (磁北)
        let currentHeading = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading

        DispatchQueue.main.async {
            self.heading = self.applyLowPassFilter(to: currentHeading)
            self.updateHeadingText(self.heading)
        }
    }

    private func applyLowPassFilter(to newHeading: Double) -> Double {
        guard let previousHeading = smoothedHeading else {
            smoothedHeading = newHeading
            return newHeading
        }

        let alpha = 0.2 // 越小越平滑，但也越有延迟

        // 计算角度差，处理 360/0 越界问题
        var diff = newHeading - previousHeading
        if diff > 180 {
            diff -= 360
        } else if diff < -180 {
            diff += 360
        }

        let smoothed = previousHeading + (alpha * diff)

        // 归一化到 0-360
        let normalized = (smoothed + 360).truncatingRemainder(dividingBy: 360)

        smoothedHeading = normalized
        return normalized
    }

    // MARK: - 辅助逻辑

    private func updateAltitudeState(for altitude: Double) {
        // Find the appropriate analogy based on altitude
        let newState: ComparisonState = altitudeMilestoneRanges.first { range in
            altitude >= range.min && altitude < range.max
        }.map { .analogy($0.analogy) } ?? .none

        withAnimation(.spring()) {
            self.comparisonState = newState

            // Re-check for specific mountain landmarks
            if let mountain = findClosestMountain(for: altitude) {
                // If we are within a reasonable range of a mountain peak, show mountain state
                // This allows the "surpassing" experience.
                let isCloseToMountain = abs(mountain.height - altitude) < (mountain.height * 0.1) || abs(mountain.height - altitude) < 500

                if isCloseToMountain {
                    self.mountainState = MountainState(
                        mountain: mountain,
                        altitudeDifference: mountain.height - altitude,
                        currentAltitude: altitude
                    )
                } else {
                    self.mountainState = nil
                }
            } else {
                self.mountainState = nil
            }
        }
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
