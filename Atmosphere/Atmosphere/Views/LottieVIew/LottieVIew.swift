//
//  LottieVIew.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/22/24.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animeName: String
    var loopMode: LottieLoopMode = .loop
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> some UIView {
        let view = UIView()
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        uiView.subviews.forEach( {$0.removeFromSuperview() })
        let animationView = LottieAnimationView()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        uiView.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: uiView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: uiView.heightAnchor)
        ])
        animationView.animation = LottieAnimation.named(animeName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()
        
    }
    
}

//struct LottieVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        LottieVIew()
//    }
//}
