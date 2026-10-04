{pkgs, ...}: {
  packages = with pkgs; [
    rustup
  ];

  languages = {
    rust = {
      enable = true;
      channel = "stable";
      targets = ["thumbv7em-none-eabihf"];
      components = ["rustc" "cargo" "llvm-tools"];
    };
  };

  env = {
    LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";
    CC_thumbv7em_none_eabihf = "${pkgs.gcc-arm-embedded}/bin/arm-none-eabi-gcc";
  };
}
