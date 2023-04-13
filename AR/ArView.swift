
import Combine
import SwiftUI
import ARKit
import AVKit
import RealityKit

class ArView : ARView{
    required init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
    }
    dynamic required init?(coder decoder: NSCoder) {
        fatalError("Not responding")
    }
    convenience init(){
        self.init(frame: UIScreen.main.bounds)
        sub()
    }
    private var cancle : Set<AnyCancellable> = []
    func sub(){
        ArManager.shared.actionStream
            .sink{[weak self] action in
                switch action{
                case .placevideo (let url):
                    self?.messi(ofURL: url)
                    
                case .removeall:
                    self?.scene.anchors.removeAll()
                }
            }
            .store(in: &cancle)
    }
    
    func messi(ofURL url: URL){
       // let url = "https://bit.ly/swswift"
//        let asset = AVAsset(url: URL(string: url)!)
        let asset = AVAsset(url: url)
        let playerItem = AVPlayerItem(asset: asset)
        let avPlayer = AVPlayer()

        // ENTITY
        let mesh = MeshResource.generateBox(width: 7, height: 3, depth: 10)
        let material = VideoMaterial(avPlayer: avPlayer)
        let entity = ModelEntity(mesh: mesh, materials: [material])

        // ANCHOR
        let anchor = AnchorEntity(world: [0,0,-10])
        anchor.addChild(entity)
        scene.addAnchor(anchor)

                
        // PLAYBACK
        avPlayer.replaceCurrentItem(with: playerItem)
        avPlayer.play()

    }
}
