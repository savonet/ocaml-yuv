type filter_mode = [
  | `None (** no interpolation *)
  | `Linear (** horizontal interpolation *)
  | `Bilinear (** horizontal and vertical interpolation *)
  | `Box (** best quality (slowest) *)
  ]

module I420 : sig
  type data = (Unsigned.UInt8.t, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t

  (** An I420 image. *)
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

  val scale : ?filter:filter_mode -> t -> t -> unit
end
