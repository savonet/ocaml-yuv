open Ctypes
open Foreign

type filter_mode = [`None | `Linear | `Bilinear | `Box]

module I420 = struct
  type data = (Unsigned.UInt8.t, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

  type t =
    {
      y : data;
      u : data;
      v : data;
      y_stride : int;
      u_stride : int;
      v_stride : int;
      width : int;
      height : int
    }
  
  let data = ptr uint8_t

  let scale = foreign "I420Scale" (data @-> int @-> data @-> int @-> data @-> int @-> int @-> int @-> data @-> int @-> data @-> int @-> data @-> int @-> int @-> int @-> int @-> returning int)

  let int_of_filter_mode : filter_mode -> int = function
    | `None -> 0
    | `Linear -> 1
    | `Bilinear -> 2
    | `Box -> 3

  let scale ?(filter=`None) (src : t) (dst : t) =
    let p b = CArray.start (array_of_bigarray array1 b) in
    let ans =
      scale
        (p src.y) src.y_stride (p src.u) src.u_stride (p src.v) src.v_stride src.width src.height
        (p dst.y) dst.y_stride (p dst.v) dst.u_stride (p dst.v) dst.v_stride dst.width dst.height
        (int_of_filter_mode filter)
    in
    (* TODO *)
    ignore ans
end
