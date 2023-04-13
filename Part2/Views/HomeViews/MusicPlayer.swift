//
//  MusicPlayer.swift
//  Inheritance
//
//  Created by 赵一田 on 2023/4/11.
//

import SwiftUI
import AVKit

struct MusicPlayer : View{
    
    
    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["Fractures","Afterword"] // 总音频列表
    @State var current = 0 // 当前播放的第几首音频
    @State var finish = false // 是否播放完成
    @State var del = AVDelegate() // 播放器的代理

    var body: some View{
        VStack(spacing:20){
            Image(uiImage:self.data.count == 0 ? UIImage(named: "cata-jj")! :  UIImage(data: self.data)!)
//            Image("openai")
                .resizable()
                .frame(width: self.data.count == 0 ? 250 : nil, height: 250)
                .cornerRadius(15)
            
            Text(self.title).font(.title).padding(.top)
            
            ZStack(alignment: .leading) {
                Capsule().fill(Color.black.opacity(0.08)).frame(height:8)
                // 红色进度等于播放进度
                Capsule().fill(Color.red).frame(width:self.width,height:8)
                // 拖拽进度条处理
                    .gesture(DragGesture()
                                .onChanged({ value in
                        let x = value.location.x
                        self.width = x
                        
                    })
                                .onEnded({ value in
                        let x = value.location.x
                        let screen = UIScreen.main.bounds.width - 30
                        // 百分比
                        let percent = x / screen
                        self.player.currentTime = Double(percent) * self.player.duration
                    })
                    )

            }
            
            
            HStack(spacing:UIScreen.main.bounds.width / 5 - 30) {
// 1.返回上一首
                Button  {
                    
                    // 检测歌曲的索引
                    if self.current > 0{
                        self.current -= 1
                        self.ChangeSongs()
                    }
                    
                } label: {
                    Image(systemName: "backward.fill").font(.title)
                }
// 2.返回前15秒
                Button  {
                    self.player.currentTime -= 15
                } label: {
                    Image(systemName: "gobackward.15").font(.title)
                }
                
// 3.播放暂停
                Button  {
                    if self.player.isPlaying {
                        self.player.pause()
                        self.playing = false
                    }
                    else {
                        if self.finish {
                            self.player.currentTime = 0
                            self.width = 0
                            self.finish = false
                        }
                    

                        self.player.play()
                        self.playing = true
                    }
                    
                } label: {
                    // 如果是播放完成 也要变回到播放按钮
                    Image(systemName:self.playing && !self.finish  ? "pause.fill" : "play.fill").font(.title)
                }
// 4.向后跳15秒
                Button  {
                    let increase = self.player.currentTime + 15
                    if increase < self.player.duration {
                        self.player.currentTime = increase
                    }
                    
                    
                } label: {
                    Image(systemName: "goforward.15").font(.title)
                }
// 5.下一首
                Button  {
                    // 检测歌曲的索引是否越界
                    if self.songs.count - 1 != self.current {
                        self.current += 1
                        self.ChangeSongs()

                    }
                } label: {
                    Image(systemName: "forward.fill").font(.title)
                }
            }
            .padding(.top,25)
            .foregroundColor(Color.black)
            
        }
        .padding()
        .onAppear{
            
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            self.player.prepareToPlay()
            self.player.delegate = self.del
            // 获取音频数据 并且把音频数据得到的data存储起来
            self.getData()
            
            // 启动定时器 播放时候 进度同步更新
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                if self.player.isPlaying {
                    // 测试播放进度
                    //print(self.player.currentTime)
                    let screen = UIScreen.main
                        .bounds.width - 30
                    
                    let value = self.player.currentTime / self.player.duration
                    
                    self.width = screen * CGFloat(value)
                }
            }
            
            // 使用通知监听歌曲是否播放完成
            NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                self.finish = true
            }
        }
    }
    
    func getData(){
        let asset = AVAsset(url: self.player.url!)
        
        for i in asset.commonMetadata {
            
            if i.commonKey?.rawValue == "artwork" {
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title"{
                let title = i.value as! String
                self.title = title

            }
        }
    }
    
    func ChangeSongs(){
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        self.player.prepareToPlay()
        
        // 切换歌曲 重新初始化音频的数据 比如 data 歌曲的图片 title 歌曲的名称
        self.data = .init(count: 0)
        self.title = ""
        
        self.getData()
        
        
//        self.playing = true
         self.playing.toggle()
        
        
        self.finish = false
        self.width = 0
        
        // 切换之后 直接播放歌曲
        self.player.play()
    }
}

// 通过代理监听歌曲是否播放完成
// 使用通知告诉视图 操作播放完成的操作
class AVDelegate : NSObject,AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
