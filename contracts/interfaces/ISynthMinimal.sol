pragma solidity >=0.5.0;

/// @title Minimal Synth interface for Uniswap
/// @notice Contains a subset of the full Synth interface that is used in Uniswap V3
interface ISynthMinimal {
    /// @notice Returns the shares owned by an account on the Synth
    /// @param account The account for which to look up the number of shares it has
    /// @return The number of shares held by the account
    function shares(address account) external view returns (uint256);

    /// @notice Transfers the amount of shares from the `msg.sender` to the recipient
    /// @param recipient The account that will receive the amount transferred
    /// @param shares_ The number of shares to send from the sender to the recipient
    /// @return Returns true for a successful transfer, false for an unsuccessful transfer
    function transferShares(address recipient, uint256 shares_) external returns (bool);

    /// @notice Returns the current allowance given to a spender by an owner
    /// @param owner The account of the token owner
    /// @param spender The account of the token spender
    /// @return The current allowance granted by `owner` to `spender` (in shares)
    function allowance(address owner, address spender) external view returns (uint256);

    /// @notice Sets the allowance of a spender from the `msg.sender` to the value `amount`
    /// @param spender The account which will be allowed to spend a given amount of the owners tokens
    /// @param amount The amount of tokens allowed to be used by `spender`
    /// @return Returns true for a successful approval, false for unsuccessful
    function approve(address spender, uint256 amount) external returns (bool);

    /// @notice Transfers `amount` shares from `sender` to `recipient` up to the allowance given to the `msg.sender`
    /// @param sender The account from which the transfer will be initiated
    /// @param recipient The recipient of the transfer
    /// @param shares_ The amount of the transfer
    /// @return Returns true for a successful transfer, false for unsuccessful
    function transferSharesFrom(address sender, address recipient, uint256 shares_) external returns (bool);

    /// @notice Event emitted when tokens are transferred from one address to another, either via `#transfer` or `#transferFrom`.
    /// @param from The account from which the tokens were sent, i.e. the balance decreased
    /// @param to The account to which the tokens were sent, i.e. the balance increased
    /// @param shares_ The amount of shares that were transferred
    event Transfer(address indexed from, address indexed to, uint256 shares_);

    /// @notice Event emitted when the approval amount for the spender of a given owner's tokens changes.
    /// @param owner The account that approved spending of its tokens
    /// @param spender The account for which the spending allowance was modified
    /// @param shares_ The new allowance from the owner to the spender
    event Approval(address indexed owner, address indexed spender, uint256 shares_);
}
