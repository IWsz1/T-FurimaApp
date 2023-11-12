// 該当のIDが存在しないページを開くとコンソールにエラーが出る

function item (){
  // 価格の入力フォームを取得
  const price_form = document.getElementById("item-price")
  // 価格の入力フォームに値に変化があったらイベント発火
  price_form.addEventListener("input",()=>{
    // 価格の入力フォームの値を取得
    const price = price_form.value
    // 値を埋め込みたいHTMLの要素を取得
    const profit = document.getElementById("profit")
    const tax = document.getElementById("add-tax-price")
    // Math.floorで切り捨て
    // 手数料の計算
    const tax_value = Math.floor(price * 0.1)
    // toLocaleStringを使うと3桁おきに,がつく文字列になる
    // 手数料をHTMLに埋め込む
    tax.innerHTML = tax_value.toLocaleString()
    // tax.innerHTMLは文字列になってしまったため計算ではtax_valueを使う
    // 価格から手数料を引いて利益を出す
    const profit_value = price - tax_value
    // 利益を表示
    profit.innerHTML = profit_value.toLocaleString()
  })
}
  window.addEventListener("turbo:load",item);