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

import XCTest
import Data4LifeSDKUtils

class DataValidatorTests: XCTestCase {

    private var bundle: Bundle = Bundle.current
    private let dataValidatorWithLimit = DataValidator(supportedMimeTypes: [.jpeg], upperFilesizeLimitInBytes: 2 * 1024 * 1024)
    private let dataValidatorWithoutLimit = DataValidator(supportedMimeTypes: [.jpeg], upperFilesizeLimitInBytes: nil)
    private let d4lDataValidator = DataValidator.d4lSDK

    func testSupportedMimeType() {
        let data = bundle.data(forResource: "sample", withExtension: "jpg")!
        XCTAssertNoThrow(try dataValidatorWithLimit.validateMimeType(of: data), "It should not throw Mime type error")
    }

    func testUnsupportedMimeType() {
        let data = bundle.data(forResource: "sample", withExtension: "png")!
        XCTAssertThrowsError(try dataValidatorWithLimit.validateMimeType(of: data), "It should throw Mime type error", { error in
            guard let error = error as? DataValidationError else {
                XCTFail("Thrown wrong error")
                return
            }
            XCTAssertEqual(error, .invalidType)
        })
    }

    func testCorrectlySizedData() {
        let data = Data(count: 1 * 1024 * 1024)
        XCTAssertNoThrow(try dataValidatorWithoutLimit.validateSize(of: data), "It should not throw size error on unlimited")
        XCTAssertNoThrow(try dataValidatorWithLimit.validateSize(of: data), "It should not throw size error on correct limit")
    }

    func testOversizedData() {
        let data = Data(count: 3 * 1024 * 1024)
        XCTAssertNoThrow(try dataValidatorWithoutLimit.validateSize(of: data), "It should not throw size error on unlimited")
        XCTAssertThrowsError(try dataValidatorWithLimit.validateSize(of: data), "It should throw size error on overflowed limit", { error in
            guard let error = error as? DataValidationError else {
                XCTFail("Thrown wrong error")
                return
            }
            XCTAssertEqual(error, .invalidSize)
        })
    }

    func testD4lDataValidatorSize() {
        let sizedData = Data(count: 1 * 1024 * 1024)
        XCTAssertNoThrow(try d4lDataValidator.validateSize(of: sizedData), "It should not throw size error on d4l")
    }

    func testD4lDataValidatorType() {
        let data = bundle.data(forResource: "sample", withExtension: "jpg")!
        XCTAssertNoThrow(try d4lDataValidator.validateMimeType(of: data), "It should not throw type error on d4l")
    }
}
