import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "num1", "num2", "add", "sub", "mul", "div" ]

  getNumberValue(target) {
    return parseFloat(this[target].value) || 0;
  }

  addition() {
    const num1 = this.getNumberValue("num1Target");
    const num2 = this.getNumberValue("num2Target");
    const sum = num1 + num2;
    this.addTarget.textContent = sum;
  }

  subtraction() {
    const num1 = this.getNumberValue("num1Target");
    const num2 = this.getNumberValue("num2Target");
    const sub = num1 - num2;
    this.subTarget.textContent = sub;
  }

  multiplication() {
    const num1 = this.getNumberValue("num1Target");
    const num2 = this.getNumberValue("num2Target");
    const mul = num1 * num2;
    this.mulTarget.textContent = mul;
  }

  division() {
    const num1 = this.getNumberValue("num1Target");
    const num2 = this.getNumberValue("num2Target");
    const div = num1 / num2;
    this.divTarget.textContent = div;
  }
}
