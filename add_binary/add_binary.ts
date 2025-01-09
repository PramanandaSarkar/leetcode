function addBinary(a: string, b: string): string {
  let ans: string = "";
  let carry: number = 0;
  
  let i: number = a.length - 1;
  let j: number = b.length - 1;
  
  while (i >= 0 || j >= 0 || carry > 0) {
    if (i >= 0) {
      carry += parseInt(a[i]);
      i--;
    }
    
    if (j >= 0) {
      carry += parseInt(b[j]);
      j--;
    }
    ans += (carry % 2).toString();
    carry = Math.floor(carry / 2);
    
  }
  return ans.split("").reverse().join("");
};

console.log(addBinary("11", "1"));
console.log(addBinary("1010", "1011"));