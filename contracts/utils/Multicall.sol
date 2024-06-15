// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (utils/Multicall.sol)

pragma solidity ^0.8.0;

import "./Address.sol";

/**
 * @dev Provides a function to batch together multiple calls in a single external call.
 *
 * _Available since v4.1._
 */
abstract contract Multicall {
    /**
     * @dev Receives and executes a batch of function calls on this contract.
     */
    function multicall(bytes[] calldata data) external virtual returns (bytes[] memory results) {
        uint256 len = data.length;
        results = new bytes[](len);
        for (uint256 i = 0; i < len;) {
            results[i] = Address.functionDelegateCall(address(this), data[i]);
            unchecked {
                i++;
            }
        }
        return results;
    }
}
