import Foundation

class StopwatchModel: ObservableObject {
    @Published var counter: Double = 0.0
    @Published var isRunning: Bool = false
    private var timer: Timer?
    
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.035, repeats: true) { [weak self] _ in
            self?.counter += 0.035
        }
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func stop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        stop()
        counter = 0.0
    }
    
    var timeString: String {
        let minutes = Int(counter / 60)
        let seconds = counter.truncatingRemainder(dividingBy: 60)
        return String(format: "%02d:%05.2f", minutes, seconds)
    }
} 