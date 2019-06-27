//
//  setRingerProfile.swift
//  ringerPOC
//
//  Created by Soudamini Ambike on 26/06/19.
//  Copyright © 2019 Soudamini Ambike. All rights reserved.
//

import Foundation
import AudioToolbox
import AVFoundation

let kVoiceMailTone  = 1002
let kMailSentTone  = 1001
let kCalendarAlertTone  = 1005
let kVCRingingTone  = 1151
let kSample1Tone  = 1016
let kNewsFlashTone  = 1328
let kBloomTone  = 1321


public class SetRingerProfile: NSObject {
    
    static var playSoundBool = false
    static let audioSession = AVAudioSession.sharedInstance()
    static var clickCount = 0

    
    public static func activateRingerProfiles() {
        playSoundBool = true
        
        if clickCount == 0 {
            do {
                try audioSession.setActive(true)
                try audioSession.setCategory(AVAudioSession.Category.soloAmbient);
            } catch {
                print("Error Setting Up Audio Session")
            }
            self.playSound()
            
        }
        clickCount += 1
        
        
    }
    
    static public func deactivateRingerProfiles() {
        playSoundBool = false
        clickCount = 0
    }
    
    static func playSound() {
        if playSoundBool {
            AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kNewsFlashTone)) {
                AudioServicesPlayAlertSoundWithCompletion(kSystemSoundID_Vibrate, {
                    sleep(1 )
                })
                self.playSound()
            }
        }
    }
}



