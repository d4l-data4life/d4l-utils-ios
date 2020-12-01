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

import Foundation

public enum DataValidationError: Error, Equatable {
    case invalidType
    case invalidSize
}

public final class DataValidator {

    public let supportedMimeTypes: [MIMEType]
    public let upperFilesizeLimitInBytes: Int?

    public init(supportedMimeTypes: [MIMEType], upperFilesizeLimitInBytes: Int?) {
        self.supportedMimeTypes = supportedMimeTypes
        self.upperFilesizeLimitInBytes = upperFilesizeLimitInBytes
    }

    convenience init(supportedMimeTypes: [MIMEType], upperFilesizeLimitInMegabytes: Int?) {
        var upperFilesizeLimitInBytes : Int?
        if let upperFilesizeLimitInMegabytes = upperFilesizeLimitInMegabytes {
            upperFilesizeLimitInBytes = upperFilesizeLimitInMegabytes * 1024 * 1024
        }
        self.init(supportedMimeTypes: supportedMimeTypes, upperFilesizeLimitInBytes: upperFilesizeLimitInBytes)
    }
}

extension DataValidator {

    public func validateMimeType(of data: Data) throws {
        guard let type = MIMEType.of(data), supportedMimeTypes.contains(type) else {
            throw DataValidationError.invalidType
        }
    }

    public func validateSize(of data: Data) throws {
        guard let upperFilesizeLimitInBytes = upperFilesizeLimitInBytes else {
            return
        }

        guard data.sizeInBytes <= upperFilesizeLimitInBytes else {
            throw DataValidationError.invalidSize
        }
    }
}

extension DataValidator {
    enum Limit {
        static let sdkUploadSize: Int = 20
    }

    public static var d4lSDK: DataValidator {
        DataValidator(supportedMimeTypes: MIMEType.allCases,
                      upperFilesizeLimitInMegabytes: Limit.sdkUploadSize)
    }
}
