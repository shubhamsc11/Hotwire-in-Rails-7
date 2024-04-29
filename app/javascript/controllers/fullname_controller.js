import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "first_name", "last_name", "output" ]

  get_fullname() {
    this.outputTarget.textContent =
      `Hey, ${this.first_nameTarget.value} ${this.last_nameTarget.value}. How are you ?`
  }
}
