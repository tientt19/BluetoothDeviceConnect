//
//  ServiceHapWindowCovering.swift
//  BluetoothMessageProtocol
//
//  Created by Kevin Hoogheem on 7/8/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// HAP-BLE HomeKit Window Covering Service
///
/// This service describes motorized window coverings or shades.
/// examples:
/// - shutters
/// - blinds
/// - awnings etc.
@available(swift 4.0)
@available(iOS 10.0, tvOS 10.0, watchOS 3.0, OSX 10.12, *)
open class ServiceHapWindowCovering: Service {

    /// Service Name
    public static var name: String {
        return "Window Covering"
    }

    /// Service UUID
    public static var uuidString: String {
        return "0000008C-0000-1000-8000-0026BB765291"
    }

    /// Service Uniform Identifier
    public static var uniformIdentifier: String {
        return "public.hap.service.window-covering"
    }

    /// Creates Service
    public init() {
        super.init(name: ServiceHapWindowCovering.name,
                   uuidString: ServiceHapWindowCovering.uuidString,
                   uniformIdentifier: ServiceHapWindowCovering.uniformIdentifier
        )
    }
}
