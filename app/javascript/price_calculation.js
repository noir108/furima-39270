window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener("input", () => {
    const priceValue = price.value;
    let taxValue = Math.floor(priceValue * 0.1);
    let profitValue = priceValue - taxValue;

    tax.innerHTML = taxValue.toLocaleString();
    profit.innerHTML = profitValue.toLocaleString();
  })
});