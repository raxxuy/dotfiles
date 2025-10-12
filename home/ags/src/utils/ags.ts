import { Accessor } from "gnim";
import { mapAccessor } from "./base";

export function toProp(value: any | Accessor<any>) {
  const enumObject = Object(value).prototype;

  const getEnumValue = (enumValue: any | any[]): number => {
    if (Array.isArray(enumValue)) {
      return enumValue.reduce((acc, v) => acc | enumObject[v as string], 0);
    }

    return enumObject[enumValue as string];
  };

  return mapAccessor(value, getEnumValue);
}
