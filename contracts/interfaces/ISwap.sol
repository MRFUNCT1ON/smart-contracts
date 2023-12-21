// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

interface ISwap {

    /**
      * @dev Pricing function for converting between base currency && Tokens.
      * @param input_amount Amount of base currency or Tokens being sold.
      * @param input_reserve Amount of base currency or Tokens (input type) in exchange reserves.
      * @param output_reserve Amount of base currency or Tokens (output type) in exchange reserves.
      * @return Amount of base currency or Tokens bought.
      */
    function getInputPrice(uint256 input_amount, uint256 input_reserve, uint256 output_reserve) external view returns (uint256);

    /**
      * @dev Pricing function for converting between base currency && Tokens.
      * @param output_amount Amount of base currency or Tokens being bought.
      * @param input_reserve Amount of base currency or Tokens (input type) in exchange reserves.
      * @param output_reserve Amount of base currency or Tokens (output type) in exchange reserves.
      * @return Amount of base currency or Tokens sold.
      */
    function getOutputPrice(uint256 output_amount, uint256 input_reserve, uint256 output_reserve) external view returns (uint256);
    /**
     * @notice Convert base currency to Tokens.
     * @dev User specifies exact input (msg.value) && minimum output.
     * @param min_tokens Minimum Tokens bought.
     * @return Amount of Tokens bought.
     */
    function baseToTokenSwapInput(uint256 min_tokens) external payable returns (uint256);

    /**
     * @notice Convert base currency to Tokens.
     * @dev User specifies maximum input (msg.value) && exact output.
     * @param tokens_bought Amount of tokens bought.
     * @return Amount of base currency sold.
     */
    function baseToTokenSwapOutput(uint256 tokens_bought) external payable returns (uint256);

    /**
     * @notice Convert Tokens to base currency.
     * @dev User specifies exact input && minimum output.
     * @param tokens_sold Amount of Tokens sold.
     * @param min_base Minimum base currency purchased.
     * @return Amount of base currency bought.
     */
    function tokenToBaseCurrencySwapInput(uint256 tokens_sold, uint256 min_base) external returns (uint256);

    /**
     * @notice Convert Tokens to base currency.
     * @dev User specifies maximum input && exact output.
     * @param base_bought Amount of base currency purchased.
     * @param max_tokens Maximum Tokens sold.
     * @return Amount of Tokens sold.
     */
    function tokenToBaseCurrencySwapOutput(uint256 base_bought, uint256 max_tokens) external returns (uint256);

    /***********************************|
    |         Getter Functions          |
    |__________________________________*/

    /**
     * @notice Public price function for base currency to Token trades with an exact input.
     * @param base_sold Amount of base currency sold.
     * @return Amount of Tokens that can be bought with input base currency.
     */
    function getBaseCurrencyToTokenInputPrice(uint256 base_sold) external view returns (uint256);

    /**
     * @notice Public price function for base currency to Token trades with an exact output.
     * @param tokens_bought Amount of Tokens bought.
     * @return Amount of base currency needed to buy output Tokens.
     */
    function getBaseCurrencyToTokenOutputPrice(uint256 tokens_bought) external view returns (uint256);

    /**
     * @notice Public price function for Token to base currency trades with an exact input.
     * @param tokens_sold Amount of Tokens sold.
     * @return Amount of base currency that can be bought with input Tokens.
     */
    function getTokenToBaseCurrencyInputPrice(uint256 tokens_sold) external view returns (uint256);

    /**
     * @notice Public price function for Token to base currency trades with an exact output.
     * @param base_bought Amount of output base currency.
     * @return Amount of Tokens needed to buy output base currency.
     */
    function getTokenToBaseCurrencyOutputPrice(uint256 base_bought) external view returns (uint256) ;

    /**
     * @return Address of Token that is sold on this exchange.
     */
    function tokenAddress() external view returns (address) ;

    function baseBalance() external view returns (uint256);

    function tokenBalance() external view returns (uint256);

    function getBaseCurrencyToLiquidityInputPrice(uint256 base_sold) external view returns (uint256);

    function getLiquidityToReserveInputPrice(uint amount) external view returns (uint256, uint256);

    function txs(address owner) external view returns (uint256) ;


    /***********************************|
    |        Liquidity Functions        |
    |__________________________________*/

    /**
     * @notice Deposit base currency && Tokens (token) at current ratio to mint SWAP tokens.
     * @dev min_liquidity does nothing when total SWAP supply is 0.
     * @param min_liquidity Minimum number of SWAP sender will mint if total SWAP supply is greater than 0.
     * @param max_tokens Maximum number of tokens deposited. Deposits max amount if total SWAP supply is 0.
     * @return The amount of SWAP minted.
     */
    function addLiquidity(uint256 min_liquidity, uint256 max_tokens) external payable returns (uint256) ;

    /**
     * @dev Burn SWAP tokens to withdraw base currency && Tokens at current ratio.
     * @param amount Amount of SWAP burned.
     * @param min_base Minimum base currency withdrawn.
     * @param min_tokens Minimum Tokens withdrawn.
     * @return The amount of base currency && Tokens withdrawn.
     */
    function removeLiquidity(uint256 amount, uint256 min_base, uint256 min_tokens) external returns (uint256, uint256);
}