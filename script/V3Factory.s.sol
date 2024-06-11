pragma solidity >=0.7.6;

import '../contracts/UniswapV3Factory.sol';

import './lib/Strings.sol';
import 'forge-std/Script.sol';
import 'forge-std/console.sol';

function addressToString(address a) pure returns (string memory) {
    return Strings.toHexString(uint(uint160(a)), 20);
}

contract FactoryScript is Script {
    function run() public {
        string memory path = string(abi.encodePacked('./addresses/63', '/v3factory'));

        vm.startBroadcast();

        UniswapV3Factory factory = new UniswapV3Factory();

        console.logBytes32(keccak256(abi.encodePacked(type(UniswapV3Pool).creationCode)));

        vm.writeLine(path, 'V3_FACTORY: ');
        vm.writeLine(path, addressToString(address(factory)));

        vm.stopBroadcast();
    }
}
