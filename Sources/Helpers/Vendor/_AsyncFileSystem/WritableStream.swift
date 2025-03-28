//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2014-2025 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import _Concurrency

/// An asynchronous output byte stream.
///
/// This protocol is designed to be able to support efficient streaming to
/// different output destinations, e.g., a file or an in memory buffer.
///
/// The stream is generally used in conjunction with the ``WritableStream/write(_:)`` function.
/// For example:
/// ```swift
/// let stream = fileSystem.withOpenWritableFile { stream in
///     stream.write("Hello, world!".utf8)
/// }
/// ```
/// would write the UTF8 encoding of "Hello, world!" to the stream.
public protocol WritableStream: Actor {
    /// Writes a sequence of bytes to the buffer.
    func write(_ bytes: some Collection<UInt8> & Sendable) async throws

    /// Closes the underlying stream handle. It is a programmer error to write to a stream after it's closed.
    func close() async throws
}
