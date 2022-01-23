window.addEventListener('load', () => {
  if (document.getElementById("item-price")!= null){
    const itemPrice = document.getElementById("item-price");
    itemPrice.addEventListener('input', () => {
      const addTaxPrice = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit");
      const itemPriceTax = Math.round(itemPrice.value * 0.1);
      const itemPriceProfit = itemPrice.value - itemPriceTax
      addTaxPrice.innerHTML = itemPriceTax.toLocaleString()
      profit.innerHTML = itemPriceProfit.toLocaleString()
    });
  };
})
