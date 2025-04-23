import SwiftUI

struct ContentView: View {
    @StateObject private var mainStopwatch = StopwatchModel()
    @StateObject private var lapStopwatch = StopwatchModel()
    @State private var laps: [String] = []
    @State private var isLapMode: Bool = true
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                // Main Timer Display
                Text(mainStopwatch.timeString)
                    .font(.system(size: 70, weight: .thin, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                
                // Lap Timer Display
                Text(lapStopwatch.timeString)
                    .font(.system(size: 20, weight: .thin, design: .monospaced))
                    .foregroundColor(.white)
                
                // Buttons
                HStack(spacing: 80) {
                    // Lap/Reset Button
                    Button(action: handleLapReset) {
                        Text(isLapMode ? "Lap" : "Reset")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(isLapMode ? .white : .gray)
                            .frame(width: 70, height: 70)
                            .background(Circle().fill(Color.white.opacity(0.2)))
                    }
                    .disabled(!mainStopwatch.isRunning && isLapMode)
                    
                    // Start/Stop Button
                    Button(action: handleStartStop) {
                        Text(mainStopwatch.isRunning ? "Stop" : "Start")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(mainStopwatch.isRunning ? .red : .green)
                            .frame(width: 70, height: 70)
                            .background(Circle().fill(Color.white))
                    }
                }
                .padding(.top, 30)
                
                // Laps List
                List {
                    ForEach(laps.indices, id: \.self) { index in
                        HStack {
                            Text("Lap \(laps.count - index)")
                                .foregroundColor(.white)
                            Spacer()
                            Text(laps[laps.count - index - 1])
                                .foregroundColor(.white)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color.black)
            }
        }
    }
    
    private func handleStartStop() {
        if mainStopwatch.isRunning {
            mainStopwatch.stop()
            lapStopwatch.stop()
            isLapMode = false
        } else {
            mainStopwatch.start()
            lapStopwatch.start()
            isLapMode = true
        }
    }
    
    private func handleLapReset() {
        if mainStopwatch.isRunning {
            // Record lap
            laps.append(mainStopwatch.timeString)
            lapStopwatch.reset()
            lapStopwatch.start()
        } else {
            // Reset everything
            mainStopwatch.reset()
            lapStopwatch.reset()
            laps.removeAll()
            isLapMode = true
        }
    }
}

#Preview {
    ContentView()
} 