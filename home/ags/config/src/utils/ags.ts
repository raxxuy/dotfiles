import { Accessor } from "gnim";
import {
  Align,
  Exclusivity,
  Keymode,
  Orientation,
  WindowAnchor,
} from "../globals";
import type {
  Align as AlignType,
  Exclusivity as ExclusivityType,
  Keymode as KeymodeType,
  Orientation as OrientationType,
  WindowAnchor as WindowAnchorType,
} from "../types/ags";
import { mapAccessor } from "./base";

function toEnumProp<T>(
  enumObject: any,
  value: T | T[] | Accessor<T | T[]>
): number | Accessor<number>;
function toEnumProp<T>(
  enumObject: any,
  value: T | T[] | Accessor<T | T[]>
): number | Accessor<number> {
  const getEnumValue = (enumValue: T | T[]): number => {
    if (Array.isArray(enumValue)) {
      return enumValue.reduce((acc, v) => acc | enumObject[v as string], 0);
    }

    return enumObject[enumValue as string];
  };

  return mapAccessor(value, getEnumValue);
}

export const toAnchorProp = (
  value:
    | WindowAnchorType
    | WindowAnchorType[]
    | Accessor<WindowAnchorType | WindowAnchorType[]>
) => toEnumProp(WindowAnchor, value);

export const toExclusivityProp = (
  value: ExclusivityType | Accessor<ExclusivityType>
) => toEnumProp(Exclusivity, value);

export const toKeymodeProp = (value: KeymodeType | Accessor<KeymodeType>) =>
  toEnumProp(Keymode, value);

export const toAlignProp = (value: AlignType | Accessor<AlignType>) =>
  toEnumProp(Align, value);

export const toOrientationProp = (
  value: OrientationType | Accessor<OrientationType>
) => toEnumProp(Orientation, value);
