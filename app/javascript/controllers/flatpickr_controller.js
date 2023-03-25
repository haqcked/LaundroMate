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
      minDate: "today",
      minTime: "8:00",
      maxTime: "19:00",
    })

  }
  setend() {
    const startDate = new Date(this.startTimeTarget.value)
    const date = new Date
    flatpickr(this.endTimeTarget, {
      enableTime: true,
      altInput: true,
      altFormat: "F j, Y, H:i",
      dateFormat: "Y-m-d",
      minDate: date.setDate(startDate.getDate() + 4),
      minTime: "8:00",
      maxTime: "19:00",
    })
  }
}
