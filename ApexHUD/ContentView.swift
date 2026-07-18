import SwiftUI

struct ContentView: View {
    @State private var sensorVM = OfflineSensorViewModel()
    
    var body: some View {
        ZStack {
            // 深邃背景
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            // 背景网格效果 (增加科技感)
            GridBackground()
                .opacity(0.1)
            
            VStack(spacing: 30) {
                
                // --- 顶部：指南针 HUD ---
                GameCompassView(heading: sensorVM.heading, headingText: sensorVM.headingText)
                    .padding(.top, 40)
                
                // --- 中部：海拔 HUD ---
                AltitudeHUDView(state: sensorVM.comparisonState, altitude: sensorVM.altitude)
                
                // --- 底部：经纬度数据 (离线可用) ---
                VStack(spacing: 10) {
                    HStack {
                        Text("LAT")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(String(format: "%.5f", sensorVM.latitude))
                            .foregroundColor(.blue)
                            .font(.system(.body, design: .monospaced))
                    }
                    
                    Divider().background(Color.gray)
                    
                    HStack {
                        Text("LON")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(String(format: "%.5f", sensorVM.longitude))
                            .foregroundColor(.blue)
                            .font(.system(.body, design: .monospaced))
                    }
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(15)
                .padding(.horizontal)
                
                // 离线状态标识
                HStack {
                    Image(systemName: "wifi.slash")
                    Text("OFFLINE MODE")
                        .font(.caption)
                }
                .foregroundColor(.green)
                .opacity(0.6)
                .padding(.bottom, 20)
            }.padding(20)
        }
    }
}

// 一个简单的背景网格视图
struct GridBackground: View {
    var body: some View {
        GeometryReader { geo in
            Path { path in
                // 修改 1: 将 step 显式声明为 CGFloat
                let step: CGFloat = 40
                
                // 修改 2: stride 中使用 CGFloat，geo.size.width 本身就是 CGFloat
                // stride 返回的 x 现在是 CGFloat 类型
                for x in stride(from: 0, through: geo.size.width, by: step) {
                    path.move(to: CGPoint(x: x, y: 0))
                    path.addLine(to: CGPoint(x: x, y: geo.size.height))
                }
                
                // 修改 3: 同理处理 y 轴
                for y in stride(from: 0, through: geo.size.height, by: step) {
                    path.move(to: CGPoint(x: 0, y: y))
                    path.addLine(to: CGPoint(x: geo.size.width, y: y))
                }
            }
            .stroke(Color.green, lineWidth: 0.5)
        }
    }
}

#Preview {
    ContentView()
}
