open Mm

module I = Image

let of_image (img : I.YUV420.t) =
  {
    YUV.I420.
    y = img.y;
    u = img.u;
    v = img.v;
    y_stride = img.y_stride;
    u_stride = img.uv_stride;
    v_stride = img.uv_stride;
    width = img.width;
    height = img.height;
  }

let () =
  let img = I.YUV420.create 200 100 in
  let img' = I.YUV420.create 640 480 in
  YUV.I420.scale (of_image img) (of_image img');
  let oc = open_out "out.bmp" in
  output_string oc (I.YUV420.to_BMP img');
  close_out oc
