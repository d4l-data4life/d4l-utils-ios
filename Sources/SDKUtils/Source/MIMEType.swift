//  Copyright (c) 2021 D4L data4life gGmbH
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

/**
 Sources:
 - https://en.wikipedia.org/wiki/List_of_file_signatures,
 - https://en.wikipedia.org/wiki/Magic_number_%28programming%29
 - https://www.garykessler.net/library/file_sigs.html
 - https://www.filesignatures.net/index.php?page=all&order=EXT&alpha=J
 */

import Foundation

public enum MIMEType: String, CaseIterable {

    case jpeg = "image/jpg"
    case png = "image/png"
    case tiff = "image/tiff"
    case pdf = "application/pdf"
    case dcm = "application/dicom"

    private var patterns: [[UInt8?]] {
        switch self {
        case .jpeg:
            return [[0xFF, 0xD8, 0xFF, 0xDB],
                    [0xFF, 0xD8, 0xFF, 0xE0],
                    [0xFF, 0xD8, 0xFF, 0xE1],
                    [0xFF, 0xD8, 0xFF, 0xE2],
                    [0xFF, 0xD8, 0xFF, 0xE3],
                    [0xFF, 0xD8, 0xFF, 0xE8],
                    [0xFF, 0xD8, 0xFF, 0xEE]]
        case .png:
            return [[0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]]
        case .tiff:
            return [[0x4D, 0x4D, 0x00, 0x2A], [0x49, 0x49, 0x2A, 0x00]]
        case .pdf:
            return [[0x25, 0x50, 0x44, 0x46, 0x2d]]
        case .dcm:
            return [[0x44, 0x49, 0x43, 0x4D]]
        }
    }

    private var offset: Int {
        switch self {
        case .dcm:
            return 0x80
        default:
            return 0x00
        }
    }

    /**
     Finds data MIME type, in case type could not be determined data is considered invalid.

     - parameter data: binary data to check
     - returns: MIMEType value or nil in case type is not recognized
     */
    public static func of(_ data: Data) -> MIMEType? {
        func isEqual(_ lhs: [UInt8?], _ rhs: [UInt8]) -> Bool {
            return zip(lhs, rhs).allSatisfy { (lhs, rhs) -> Bool in
                guard let lhsValue = lhs else { return true } // skip validation if byte is nil
                return lhsValue == rhs
            }
        }
        return MIMEType.allCases.first(where: { type in
            let foundType = type.patterns.first(where: { pattern in
                let upperBound = type.offset + (pattern.count - 1)
                guard data.bytes.count > upperBound else { return false }
                let magic = Array(data.bytes[type.offset...upperBound])
                return isEqual(pattern, magic)
            })
            return foundType != nil
        })
    }
}
