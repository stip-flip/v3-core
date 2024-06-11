// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity >=0.6.0;

import '../interfaces/ISynthMinimal.sol';
import '../interfaces/IERC20Minimal.sol';

library BalanceHelper {
    function balance(address token) internal view returns (uint256) {
        if (token == 0x1953cab0E5bFa6D4a9BaD6E05fD46C1CC6527a5a) {
            (bool success, bytes memory data) = token.staticcall(
                abi.encodeWithSelector(IERC20Minimal.balanceOf.selector, address(this))
            );
            require(success && data.length >= 32);
            return abi.decode(data, (uint256));
        } else {
            (bool success, bytes memory data) = token.staticcall(
                abi.encodeWithSelector(ISynthMinimal.shares.selector, address(this))
            );
            require(success && data.length >= 32);
            return abi.decode(data, (uint256));
        }
    }
}
