import { Accessor } from "gnim";

// Map raw value or Accessor through a converter, preserving reactivity
export function mapAccessor<T, R>(
  value: T | Accessor<T>,
  map: (v: T) => R
): R | Accessor<R> {
  return value instanceof Accessor ? value.as(map) : map(value as T);
}