//
//  AllDoneView.swift
//  Cal AI - Clone
//
//  Created by Aung Kyaw Mon on 2/22/2568.
//

import SwiftUI
import Lottie

struct AllDoneView: View {
    @State private var isViewVisible = false
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            
            VStack {
                
                HStack(spacing: 4) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.green)
                    
                    Text("all_done".localized)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                
                Text("thank_you_for_trusting_us".localized)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
                
                Spacer()
                    .frame(height: 20)
                
                Text("all_done_description".localized)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .opacity(isViewVisible ? 1 : 0)
                    .animation(.easeIn(duration: 0.5), value: isViewVisible)
            }
            .overlay(
                LottieView(name: "success_lottie", loopMode: .loop)
                    .frame(width: 200, height: 200) // Adjust size as needed
                    .offset(y: -0) // Adjust this value to position the animation vertically
            )
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .onAppear {
            // Trigger animations
            isViewVisible = true
            
        }
        .onDisappear {
            // Reset states
            isViewVisible = false
        }
    }
}

// Lottie View UIViewRepresentable
struct LottieView: UIViewRepresentable {
    var name: String
    var loopMode: LottieLoopMode
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(name)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
    }
}

#Preview {
    AllDoneView()
}
