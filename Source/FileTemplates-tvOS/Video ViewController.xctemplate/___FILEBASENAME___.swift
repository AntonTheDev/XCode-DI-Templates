//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation
import UIKit
import AVFoundation

/*
    Add the following in the registerViewControllers() method of the
    Services class.

        viewControllerContainer.register(___FILEBASENAME___.self) { _ in ___FILEBASENAME___(container: self.viewControllerContainer) }
            .initCompleted { (r, controller) in
                // Rersolve Services as needed
        }
*/

struct ___FILEBASENAME___Config {

    static let videoFileName   : String     = "Fireworks"
    static let videoFileType   : String     = "mp4"

    static let videoGravity    : String     = AVLayerVideoGravityResizeAspectFill

    static let playButtonStartTitle    : String     = "Start Recording"
    static let playButtonStopTitle     : String     = "Stop Recording"
}

class ___FILEBASENAME___ : BaseViewController {

    var playerItem : AVPlayerItem?

    override func configureData() {
        guard let urlPath = Bundle.main.path(forResource: ___FILEBASENAME___Config.videoFileName,
                                             ofType:___FILEBASENAME___Config.videoFileType) else {
                                                return
        }
        playerItem = AVPlayerItem(url: NSURL(fileURLWithPath: urlPath) as URL)
        videoPlayer.replaceCurrentItem(with: playerItem)
    }

    override func setupInterface() {
        view.layer.addSublayer(videoPlayerLayer)
        view.addSubview(playButton)
    }

    override func layoutInterface() {
        videoPlayerLayer.frame = view.bounds
        playButton.alignWithSize(CGSize(width : view.bounds.width, height : 80.0),
                                 toFrame: view.bounds,
                                 horizontal: .center,
                                 vertical: .base)

    }

    // Lazy Laoded Views

    lazy var videoPlayerLayer : AVPlayerLayer = {
        let layer = AVPlayerLayer()
        return layer
    }()

    lazy var videoPlayer : AVPlayer = {
        let player = AVPlayer()
        self.videoPlayerLayer.player = player
        self.videoPlayerLayer.videoGravity = ___FILEBASENAME___Config.videoGravity
        return player
    }()

    lazy var playButton : UIButton = {
        [unowned self] in
        let button: UIButton = UIButton()
        button.setTitle(___FILEBASENAME___Config.playButtonStartTitle, for: .normal)
        button.addTarget(self, action: #selector(self.togglePlayBack), for: .touchUpInside)
        return button
        }()
}

extension ___FILEBASENAME___ {

    func togglePlayBack() {
        if playButton.titleLabel?.text == ___FILEBASENAME___Config.playButtonStopTitle {
            playButton.setTitle(___FILEBASENAME___Config.playButtonStartTitle, for: .normal)
            stop()
        } else {
            playButton.setTitle(___FILEBASENAME___Config.playButtonStopTitle, for: .normal)
            play()
        }
    }

    func play() {
        videoPlayer.play()
    }

    func stop() {
        videoPlayer.rate = 0.0
        videoPlayer.pause()
        configureData()
    }
}
