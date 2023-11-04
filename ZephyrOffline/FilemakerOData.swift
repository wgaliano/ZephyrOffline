//
//  FilemakerOData.swift
//  ZephyrTesting
//
//  Created by Вячеслав Горев on 7/9/2023.
//

import Foundation

/// Used to decode FileMaker OData response
struct FileMakerODataResponse<T: Decodable>: Decodable {
    var value: T
}
