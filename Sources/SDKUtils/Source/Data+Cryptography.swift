//  Copyright (c) 2020 D4L data4life gGmbH
//  All rights reserved.
//  
//  D4L owns all legal rights, title and interest in and to the Software Development Kit ("SDK"),
//  including any intellectual property rights that subsist in the SDK.
//  
//  The SDK and its documentation may be accessed and used for viewing/review purposes only.
//  Any usage of the SDK for other purposes, including usage for the development of
//  applications/third-party applications shall require the conclusion of a license agreement
//  between you and D4L.
//  
//  If you are interested in licensing the SDK for your own applications/third-party
//  applications and/or if you’d like to contribute to the development of the SDK, please
//  contact D4L by email to help@data4life.care.

import class CryptoSwift.SHA1
import Foundation
import enum CryptoKit.Insecure

extension Data {
    public var sha1Hash: String {
        if #available(iOS 13.0, macOS 10.15, *) {
            let digest = Insecure.SHA1.hash(data: self)
            let digestData = Data(digest)
            return digestData.base64EncodedString()
        } else {
            return self.sha1().base64EncodedString()
        }
    }
}
