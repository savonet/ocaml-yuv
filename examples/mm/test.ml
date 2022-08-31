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
  let src = I.YUV420.create 200 100 in
  let dst = I.YUV420.create 640 480 in
  I.YUV420.gradient_uv src (0, 0) (0xff, 0) (0, 0xff);
  YUV.I420.scale ~filter:`Bilinear (of_image src) (of_image dst);
  let oc = open_out "out.bmp" in
  output_string oc (I.YUV420.to_BMP dst);
  close_out oc
