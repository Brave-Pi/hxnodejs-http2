package js.lib;
import haxe.io.UInt8Array;
import haxe.extern.EitherType;
import js.lib.*;
typedef TypedArray = EitherType<Int8Array, EitherType<UInt8Array, EitherType<Uint8ClampedArray, EitherType<Int16Array, EitherType<Uint16Array, EitherType<Int32Array, EitherType<Uint32Array, EitherType<Float32Array, Float64Array>>>>>>>>;