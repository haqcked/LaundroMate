import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-item"
export default class extends Controller {
  static targets = ["addItem", "form"];

  connect() {
    console.log(this.addItemTarget);

  }

  add(event) {
    // console.log(this.formTarget)
    event.preventDefault()
    const url = this.formTarget.action
    const method = this.formTarget.method || 'POST'
    // console.log(this.formTarget)
    const serviceOption = this.formTarget.querySelector('#line_item_service_id option:checked')
    const price = serviceOption.getAttribute('data-price')
    const service = serviceOption.getAttribute('data-service')
    const weight = serviceOption.getAttribute('data-weight')
    const formData = new FormData(this.formTarget)
    fetch(url, {
      method: method,
      body: formData
    })
      .then(response => response.json())
      .then(data => {
        console.log(data)
        const modal = document.getElementById("modal")
        console.log(modal)
        let subtotal = 0
        for (let i = 0; i < modal.children.length; i++) {
          const childElement = modal.children[i];

          if (childElement.classList.contains('card-order')) {
            const priceElement = childElement.querySelector('p:nth-child(3) strong');
            const priceValue = priceElement.textContent.trim().split('$')[1];
            console.log(priceElement)
            console.log(priceValue)
            subtotal += parseInt(priceValue);
          }
            // Update the DOM with the extracted price value

        }
        const id = 'subtotal';
        const elementToUpdate = document.getElementById(id);
        subtotal += parseInt(price)
        modal.insertAdjacentHTML("beforeend",  "<div class='card-order p-4'>" + "<p>Service: <strong> " + `${service}` + "</strong></p>" +  "<p>Weight: <strong>" + `${weight}` + "</strong></p>" + "<p>Price: <strong>$" + `${price}` + "</strong></p>" + "<form class='button_to' method='post' action='/line_items/31'><input type='hidden' name='_method' value='delete' autocomplete='off'><button class='btn btn-danger' type='submit'>Remove item</button><input type='hidden'></form>" + "</div>")
        document.getElementById("subtotal").innerHTML = "Sub Total: $" + `${subtotal}`
      })
      .catch(error => console.error(error))
  }
}
