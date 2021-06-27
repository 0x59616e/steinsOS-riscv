fn main() {
  cc::Build::new()
        .file("boot.s")
        .compile("foo");
}