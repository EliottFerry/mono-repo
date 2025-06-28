import { health } from "@repo/maths";
import { add } from "@repo/maths/addition";

export function print() {
  health();
  console.log(add(1, 2));
}
