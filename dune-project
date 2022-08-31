(lang dune 3.0)
(version 0.1.0)
(name yuv)
(source (github savonet/ocaml-yuv))
(license LGPL-2.1)
(authors "Samuel Mimram <smimram@gmail.com>")
(maintainers "The Savonet Team <savonet-users@lists.sourceforge.net>")

(generate_opam_files true)
(using ctypes 0.1)

(package
 (name yuv)
 (synopsis "Bindings to the yuv library for manipulating image in YUV format")
 (description "Bindings to the yuv library for manipulating image in YUV format. libyuv is an open source project that includes YUV scaling and conversion functionality.")
 (depends
  conf-pkg-config
  conf-yuv
  (dune (>= 2.0))
  dune-configurator
  ctypes
  ctypes-foreign))
