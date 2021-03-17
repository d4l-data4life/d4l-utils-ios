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

import XCTest
import Data4LifeSDKUtils

class MIMETypeTests: XCTestCase {

    private var bundle: Bundle = Bundle.current

    func testJPEGData() {
        let data1 = Data([0xFF, 0xD8, 0xFF, 0xDB, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data1), MIMEType.jpeg)

        let data2 = Data([0xFF, 0xD8, 0xFF, 0xE1, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data2), MIMEType.jpeg)

        let data3 = Data([0xFF, 0xD8, 0xFF, 0xE2, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data3), MIMEType.jpeg)

        let data4 = Data([0xFF, 0xD8, 0xFF, 0xE3, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data4), MIMEType.jpeg)

        let data5 = Data([0xFF, 0xD8, 0xFF, 0xE8, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data5), MIMEType.jpeg)

        let data6 = Data([0xFF, 0xD8, 0xFF, 0xE0, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data6), MIMEType.jpeg)

        let data7 = Data([0xFF, 0xD8, 0xFF, 0xEE, 0x01, 0x02])
        XCTAssertEqual(MIMEType.of(data7), MIMEType.jpeg)
    }

    func testJFIFImageData() {
        let data = bundle.data(forResource: "sample-jfif", withExtension: "jpg")!
        XCTAssertEqual(MIMEType.of(data), MIMEType.jpeg)
    }

    func testJPEGImageData() {
        let data = bundle.data(forResource: "sample", withExtension: "jpg")!
        XCTAssertEqual(MIMEType.of(data), MIMEType.jpeg)
    }

    func testPNGData() {
        let data = Data([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, 0x01, 0x00, 0x00, 0x02])
        XCTAssertEqual(MIMEType.of(data), MIMEType.png)
    }

    func testPNGImageData() {
        let data = bundle.data(forResource: "sample", withExtension: "png")!
        XCTAssertEqual(MIMEType.of(data), MIMEType.png)
    }

    func testTIFFData() {
        let data = Data([0x4D, 0x4D, 0x00, 0x2A, 0x01, 0x00, 0x00, 0x02])
        XCTAssertEqual(MIMEType.of(data), MIMEType.tiff)
    }

    func testTIFFImageData() {
        let data = bundle.data(forResource: "sample", withExtension: "tiff")!
        XCTAssertEqual(MIMEType.of(data), MIMEType.tiff)
    }

    func testPDFData() {
        let data = Data([0x25, 0x50, 0x44, 0x46, 0x2d, 0x01, 0x00, 0x00, 0x02])
        XCTAssertEqual(MIMEType.of(data), MIMEType.pdf)
    }

    func testPDFDocumentData() {
        let data = bundle.data(forResource: "sample", withExtension: "pdf")!
        XCTAssertEqual(MIMEType.of(data), MIMEType.pdf)
    }

    func testDCMData() {
        // magic pattern is [0x44, 0x49, 0x43, 0x4D] and starts from 0x80
        var bytes = [UInt8](repeating: 0x00, count: 0x86)
        bytes[0x80] = 0x44
        bytes[0x81] = 0x49
        bytes[0x82] = 0x43
        bytes[0x83] = 0x4D
        bytes[0x84] = 0x01
        bytes[0x85] = 0x02
        let data = Data(bytes)
        XCTAssertEqual(MIMEType.of(data), MIMEType.dcm)
    }

    func testDCMDocumentData() {
        let data = bundle.data(forResource: "sample", withExtension: "dcm")!
        XCTAssertEqual(MIMEType.of(data), MIMEType.dcm)
    }
}

extension Bundle {
    static var current: Bundle {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: MIMETypeTests.self)
        #endif
    }

    func data(forResource named: String, withExtension type: String) -> Data? {
        if let url = self.url(forResource: named, withExtension: type) {
            return try? Data(contentsOf: url)
        } else {
            return nil
        }
    }
}
