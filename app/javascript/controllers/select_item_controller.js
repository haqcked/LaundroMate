// import { Controller } from "@hotwired/stimulus"

// // Connects to data-controller="select-item"
// export default class extends Controller {
//   static targets = ["item_1", "item_2", "item_3"];

//   connect() {
//     console.log(this.item_1Target);
//     console.log(this.item_2Target.value);
//     console.log(this.item_3Target.value);
//   }

//   saveItem() {
//     console.log("pressing on 'Add to cart'")
//   }
// }












import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item_1", "item_2", "item_3"];

  saveItem() {
    const selectedItems = [];

    // Check if a weight is selected for wash, dry and fold category
    const washDryFoldSelect = this.item_1Target;
    const washDryFoldValue = washDryFoldSelect.value;
    if (washDryFoldValue !== "") {
      const selectedItem = {
        service_id: washDryFoldValue,
        category: washDryFoldSelect.getAttribute("data-select-item-target")
      };
      selectedItems.push(selectedItem);
    }

    // Check if a weight is selected for wash, dry and iron category
    const washDryIronSelect = this.item_2Target;
    const washDryIronValue = washDryIronSelect.value;
    if (washDryIronValue !== "") {
      const selectedItem = {
        service_id: washDryIronValue,
        category: washDryIronSelect.getAttribute("data-select-item-target")
      };
      selectedItems.push(selectedItem);
    }

    // Check if a weight is selected for iron category
    const ironSelect = this.item_3Target;
    const ironValue = ironSelect.value;
    if (ironValue !== "") {
      const selectedItem = {
        service_id: ironValue,
        category: ironSelect.getAttribute("data-select-item-target")
      };
      selectedItems.push(selectedItem);
    }

    // Save the selected items to line items
    if (selectedItems.length > 0) {
      const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content");
      fetch("/line_items", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken
        },
        body: JSON.stringify({ line_item: selectedItems })
      }).then(response => {
        if (response.ok) {
          // Redirect to the cart page or update the cart in the UI
          window.location.href = "/cart";
        } else {
          // Handle the error
          console.error(response.statusText);
        }
      }).catch(error => {
        console.error(error);
      });
    }
  }
}
