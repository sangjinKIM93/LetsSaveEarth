//
//  PlayerViewController.swift
//  LetsSaveEarth
//
//  Created by 김상진 on 2021/08/31.
//

import UIKit
import AVKit

class PlayerViewController: UIViewController {
    
    let imageView = UIImageView().then {
        $0.backgroundColor = .brown
    }
    let playButton = UIButton().then {
        $0.setImage(UIImage(systemName: "play"), for: .normal)
        $0.addTarget(self, action: #selector(onClickPlayButton), for: .touchUpInside)
    }
    
    public var position: Int = 0
    public var meditationContents: [MeditationContent] = []
    private var player: AVAudioPlayer!

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        configureAudio()
    }
    
    private func setupView() {
        self.view.backgroundColor = .white
        
        [imageView, playButton].forEach {
            self.view.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(250)
        }
        playButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(100)
            $0.width.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configureAudio() {
        let urlString = Bundle.main.path(forResource: "sound_piano_three_min", ofType: "mp3")
        
        do {
            guard let urlString = urlString,
                  let firlURL = URL(string: urlString) else {
                return
            }
            player = try AVAudioPlayer(contentsOf: firlURL)
            
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            player.play()
            
        } catch {
            print("player Error Occured")
        }
    }
    
    @objc private func onClickPlayButton() {
        if player.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            player.play()
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
    }
}
