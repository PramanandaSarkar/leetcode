function coinChange(coins: number[], amount: number): number {
    let minCoins = new Array(amount + 1).fill(amount + 1)
    minCoins[0] = 0
    for(let i =1; i<= amount; i++){
        for(let j=0; j< coins.length; j++){
            if (i - coins[j] >= 0){
                minCoins[i] = Math.min(minCoins[i], 1 + minCoins[i- coins[j]])
            }
        }
    }


    return minCoins[amount] !== amount + 1? minCoins[amount] : -1
};



console.log(coinChange([1,2,5], 11))
console.log(coinChange([3], 3))
console.log(coinChange([1], 0))