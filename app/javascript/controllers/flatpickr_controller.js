import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      enableTime: true,
      altInput: true,
      altFormat: "F j, Y, H:i",
      dateFormat: "Y-m-d",
      minTime: "8:00",
      maxTime: "19:00",
    })
    flatpickr(this.endTimeTarget, {
      enableTime: true,
      altInput: true,
      altFormat: "F j, Y, H:i",
      dateFormat: "Y-m-d",
      minTime: "8:00",
      maxTime: "19:00",
    })
  }
}

