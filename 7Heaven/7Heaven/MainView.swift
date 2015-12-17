//
//  ViewController.swift
//  7Heaven
//
//  Created by Michael Reynolds on 12/16/15.
//  Copyright © 2015 Michael Reynolds. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

//var shufflemode: MPMusicShuffleMode?

class MainView: UIViewController{
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var timer: NSTimer?
    var paused = true
    var originalCount = 600
    var timerCount = 0
    
    let avQueuePlayer = AVQueuePlayer()
    var songs = Array<Song>()
    var currentSong: Song?
    var nowPlaying: Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupAudioSession()
        configurePlaylist()
        loadCurrentSong()
        
//        let shuffleSongs = MPMusicShuffleMode.Songs
//        switch shuffleSongs
//        {
//            case .Songs:
//                print("Mostly harmless")
//            default:
//                print("Not a safe place for humans")
//        }
        
        originalCount = 420
        countLabel.text = "7:00"
        playButton.setTitleColor(UIColor.blackColor(), forState: .Selected)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK - Timer
    
    func startStopTimer()
    {
        if timerCount % 2 == 0
        {
            timer?.invalidate()
        }
        else
        {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateUI", userInfo: nil, repeats: true)
        updateUI()
        }
    }
    
    func stopTimer()
    {
        timer?.invalidate()
        timer = nil
    }
    
    func updateUI()
    {
        originalCount = originalCount - 1
        let newMinuteCount = originalCount/60
        let newSecondCount = originalCount%60
        countLabel.text = String("\(newMinuteCount):\(newSecondCount)")
        
        if timerCount >= 1
        {
            countLabel.textColor = UIColor.cyanColor()
        }
        if originalCount <= 415
        {
            statusLabel.textColor = UIColor.cyanColor()
        }
        if originalCount <= 400
        {
            statusLabel.textColor = UIColor.blackColor()
        }
        if originalCount <= 0
        {
            countLabel.textColor = UIColor.redColor()
        }
        
        if originalCount == 0
        {
            playNotification()
        }
    }
    
    // MARK: - Audio
    
    func setupAudioSession()
    {
        AVAudioSession.sharedInstance().requestRecordPermission({(granted: Bool)-> Void in
            if granted
            {
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                    //                    try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions: .DuckOthers)
                }
                catch _ {
                }
                do {
                    try AVAudioSession.sharedInstance().setActive(true)
                }
                catch _ {
                    
                }
            }
            else
            {
                print("Audio session could not be configured: user denied permission")
            }
        })
        
    }
    
    func configurePlaylist()
    {
        let One = Song(filename: "One")
        songs.append(One)
        
        let Two = Song(filename: "Two")
        songs.append(Two)
        currentSong = Two
        
        let Three = Song(filename: "Three")
        songs.append(Three)
        
        let Four = Song(filename: "Four")
        songs.append(Four)
        
        let Five = Song(filename: "Five")
        songs.append(Five)
        
        let Six = Song(filename: "Six")
        songs.append(Six)
        
        let Seven = Song(filename: "Seven")
        songs.append(Seven)
        
        let Eight = Song(filename: "Eight")
        songs.append(Eight)
        
        let Nine = Song(filename: "Nine")
        songs.append(Nine)
        
        let Ten = Song(filename: "Ten")
        songs.append(Ten)
        
        let Eleven = Song(filename: "Eleven")
        songs.append(Eleven)
    }
    
    func loadCurrentSong()
    {
        avQueuePlayer.removeAllItems()
        if let song = currentSong
        {
            song.playerItem.seekToTime(CMTimeMakeWithSeconds(0.0, 1))
            avQueuePlayer.insertItem(song.playerItem, afterItem: nil)
        }
    }
    
    func togglePlayback(play: Bool)
    {
        nowPlaying = play
        if play
        {
            avQueuePlayer.play()
        }
        else
        {
            avQueuePlayer.pause()
        }
    }
    
    func playPause()
    {
        if nowPlaying == true
        {
            avQueuePlayer.pause()
            nowPlaying = false
            playButton.setTitleColor(UIColor.cyanColor(), forState: .Normal)
            playButton.setTitle("Play", forState: UIControlState .Normal)
        }
        else if nowPlaying == false
        {
            avQueuePlayer.play()
            nowPlaying = true
            playButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            playButton.setTitle("Paz", forState: UIControlState .Normal)
        }
    }
    
    func playNotification()
    {
        let soundURL = NSBundle.mainBundle().URLForResource("SessionOver", withExtension: "m4a")!
        var soundID: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }
    
    @IBAction func playButtonTapped(sender: UIButton!)
    {
        timerCount = timerCount + 1
        startStopTimer()
        playPause()
    }
    
    @IBAction func skipForwardTapped(sender: UIButton)
    {
        if nowPlaying == true
        {
            let currentSongIndex = (songs as NSArray).indexOfObject(currentSong!)
            let nextSong: Int
            
            if currentSongIndex + 1 >= songs.count
            {
                nextSong = 0
            }
            else
            {
                nextSong = currentSongIndex + 1
            }
            currentSong = songs[nextSong]
            loadCurrentSong()
            togglePlayback(true)
        }
    }
    
    @IBAction func resetPressed(sender: UIButton!)
    {
        stopTimer()
        loadCurrentSong()
        if timerCount % 2 == 0
        {
            originalCount = 420
        }
        else
        {
            originalCount = 421
        }
        updateUI()
        startStopTimer()
    }

}

// MARK - MPMusicShuffleMode

enum MPMusicShuffleMode : Int
{
    case Default
    case Off
    case Songs
    case Albums
}


