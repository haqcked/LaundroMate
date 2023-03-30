import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="select-item"
export default class extends Controller {
  static targets = ["addItem", "form"];

  connect() {

  }

  add(event) {
    event.preventDefault()

    const currentForm = event.currentTarget.closest("form");
    const url = currentForm.action;
    const method = currentForm.method || "POST";
    const serviceOption = currentForm.querySelector(
      "#line_item_service_id option:checked"
    );
    const price = serviceOption.getAttribute("data-price");
    const service = serviceOption.getAttribute("data-service");
    const weight = serviceOption.getAttribute("data-weight");
    const formData = new FormData(currentForm);
    if (service == null) {
      return
    }

    // Check if the service is already in the cart
    const modal = document.getElementById("modal");
    for (let i = 0; i < modal.children.length; i++) {
      const childElement = modal.children[i];
      if (childElement.classList.contains("card-order")) {
      const existingService = childElement.querySelector("p:nth-child(1) strong").textContent.trim();
      if (existingService === service) {
        return;
      }
    }
  }

    fetch(url, {
      method: method,
      body: formData,
    })
      .then((response) => {
        const modal = document.getElementById("modal");
        let subtotal = 0;
        for (let i = 0; i < modal.children.length; i++) {
          const childElement = modal.children[i];
          if (childElement.classList.contains("price")) {
            const priceElement = childElement.querySelector("p:nth-child(1) strong");
            const priceValue = priceElement.textContent.trim().split("€")[1];
            subtotal += parseInt(priceValue);
          }
        }
        const id = "subtotal";
        const elementToUpdate = document.getElementById(id);
        subtotal += parseInt(price);
        // if (service !== null) {
          modal.insertAdjacentHTML(
            "beforeend",
            "<div class='card-order card p-4 mb-3'>" +
              "<p>Service: <strong>" + `${service}` + "</strong></p>" +
              "<p>Weight: <strong>" + `${weight}` + "</strong></p>" +
              "<div class='d-flex justify-content-between price card-order'>" +
                "<p>Price: <strong>" + `${price}` + "€</strong></p>" +
                "<form class='button_to' method='post' action='/line_items/31'><input type='hidden' name='_method' value='delete' autocomplete='off'><button class='btn btn-outline-danger' type='submit'>x</button><input type='hidden'></form>" +
              "</div>" +
            "</div>"
          );
          document.getElementById("subtotal").innerHTML = "Subtotal: " + `${subtotal}` + ".00€";
        // }
      })
      .catch((error) => console.error(error));
  }
}
