//
//  Song.swift
//  7Heaven
//
//  Created by Michael Reynolds on 12/16/15.
//  Copyright © 2015 Michael Reynolds. All rights reserved.
//

import Foundation
import AVFoundation

class Song
{
    let filename: String
    
    let playerItem: AVPlayerItem
    
    init(filename: String)
    {
        self.filename = filename
        self.playerItem = AVPlayerItem(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(filename, ofType: "mp3")!))
    }
    
}