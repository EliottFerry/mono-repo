import { health } from "maths";
import { add } from "maths/addition";

export function print() {
  health();
  console.log(add(1, 2));
}
