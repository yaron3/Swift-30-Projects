import SwiftUI

protocol AnimationViewProtocol: View {
    var isAnimating: Bool { get }
    var animationDuration: Double { get }
    var animationDelay: Double { get }
}

extension AnimationViewProtocol {
    var animationDuration: Double { 2.0 }
    var animationDelay: Double { 0.2 }
} 