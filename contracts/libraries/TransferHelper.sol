// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.0;

import '../interfaces/ISynthMinimal.sol';
import '../interfaces/IERC20Minimal.sol';

import './Constants.sol';

/// @title TransferHelper
/// @notice Contains helper methods for interacting with ERC20 tokens that do not consistently return true/false
library TransferHelper {
    /// @notice Transfers tokens from msg.sender to a recipient
    /// @dev Errors with ST if transfer fails
    /// @param token The contract address of the token which will be transferred
    /// @param to The recipient of the transfer
    /// @param value The value of the transfer
    function safeTransfer(address token, address to, uint256 value) internal {
        if (token == WETC) {
            (bool success, bytes memory data) = token.call(
                abi.encodeWithSelector(IERC20Minimal.transfer.selector, to, value)
            );
            require(success && (data.length == 0 || abi.decode(data, (bool))), 'ST');
        } else {
            (bool success, bytes memory data) = token.call(
                abi.encodeWithSelector(ISynthMinimal.transferShares.selector, to, value)
            );
            require(success && (data.length == 0 || abi.decode(data, (bool))), 'ST');
        }
    }
}
