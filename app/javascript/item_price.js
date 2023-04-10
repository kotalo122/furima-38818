window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("keyup", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const TAX_RATE = 0.1;
    const taxPrice = Math.floor(inputValue * TAX_RATE); 
    addTaxDom.innerHTML = ` ${taxPrice} `;
    
    const addProfitDom = document.getElementById("profit");
    const salesProfit = Math.floor(inputValue - taxPrice); 
    addProfitDom.innerHTML = ` ${salesProfit} `;
  });
});