// SPDX-License-Identifier: MIT
// Copyright (c) 2025 [Your Name/Organization]
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

pragma solidity ^0.8.19;

contract LxBWSCertificateAttendance {
    // Mapping to store document hashes
    mapping(bytes32 => bool) private documentHashes;
    
    // Event emitted when new documents are added
    event DocumentsAdded(bytes32[] hashes, uint256 timestamp);
    
    // Event emitted when a document is verified
    event DocumentVerified(bytes32 hash, bool exists, uint256 timestamp);

    /**
     * @dev Add multiple document hashes to the contract
     * @param hashes Array of document hashes to store
     */
    function addDocuments(bytes32[] calldata hashes) external {
        for (uint i = 0; i < hashes.length; i++) {
            require(hashes[i] != bytes32(0), "Invalid document hash");
            documentHashes[hashes[i]] = true;
        }
        
        emit DocumentsAdded(hashes, block.timestamp);
    }

    /**
     * @dev Verify if a document hash exists in the contract
     * @param hash The document hash to verify
     * @return bool indicating if the document exists
     */
    function verifyHash(bytes32 hash) external returns (bool) {
        bool exists = documentHashes[hash];
        emit DocumentVerified(hash, exists, block.timestamp);
        return exists;
    }

    /**
     * @dev View function to check if a document hash exists (no event emission)
     * @param hash The document hash to check
     * @return bool indicating if the document exists
     */
    function checkHash(bytes32 hash) external view returns (bool) {
        return documentHashes[hash];
    }

    /**
     * @dev Batch verify multiple document hashes
     * @param hashes Array of document hashes to verify
     * @return results Array of boolean results indicating existence of each hash
     */
    function verifyHashes(bytes32[] calldata hashes) external view returns (bool[] memory results) {
        results = new bool[](hashes.length);
        
        for (uint i = 0; i < hashes.length; i++) {
            results[i] = documentHashes[hashes[i]];
        }
        
        return results;
    }
}