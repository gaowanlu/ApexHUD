//
//  GameCompassView.swift
//  ApexHUD
//
//  Created by gaowanlu on 2026/7/19.
//


//
//  GameCompassView.swift
//  MeetXCode
//
//  Created by gaowanlu on 2026/7/19.
//

import SwiftUI

struct GameCompassView: View {
    let heading: Double
    let headingText: String
    
    var body: some View {
        ZStack {
            // 外部刻度圈
            Circle()
                .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                .frame(width: 200, height: 200)
            
            // 内部装饰圈
            Circle()
                .trim(from: 0.2, to: 0.8)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 4, lineCap: .round))
                .frame(width: 180, height: 180)
                .rotationEffect(Angle(degrees: heading)) // 刻度随手机转动
            
            // 北 (N) 标记
            Text("N")
                .font(.system(size: 20, weight: .heavy, design: .rounded))
                .foregroundColor(.red)
                .offset(y: -70)
                .rotationEffect(Angle(degrees: -heading)) // N 永远指向北方
            
            // 核心指针 (HUD 风格)
            Image(systemName: "triangle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.cyan)
                .offset(y: -60)
                .shadow(color: .cyan, radius: 5)
            
            // 当前方向文字
            VStack {
                Text(headingText)
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                
                Text("\(Int(heading))°")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .offset(y: 90)
        }
    }
}
