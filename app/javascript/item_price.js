

    window.addEventListener('turbo:load', () => {
      const priceInput = document.getElementById("item-price");
      const profitDom = document.getElementById("profit");
    
      priceInput.addEventListener("input", () => {
        const inputValue = priceInput.value;
        
    
       
    const addTaxDom = document.getElementById("add-tax-price");
    const price = parseInt(inputValue, 10);
    const salesFee = Math.floor(price * 0.1); 
    const salesProfit = Math.floor(price - salesFee); // 販売利益
    addTaxDom.innerHTML = salesFee; // 販売手数料を表示
    profitDom.innerHTML = salesProfit; // 販売利益を表示
  });
});