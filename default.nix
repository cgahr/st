{ pkgs ? import <nixpkgs> { }
}:
let
  diff = import ./st-colors.nix { };
  file = builtins.toFile "st-colors.diff" diff;
  path = builtins.toString file;

in
pkgs.st.overrideAttrs (oldAttrs: {
  patches = with pkgs; [
    # (fetchpatch {
    #   url = "https://st.suckless.org/patches/copyurl/st-copyurl-multiline-20230406-211964d.diff";
    #   sha256 = "1249iql1xnlxka6zl5bbsh9ji6r53fpki0aqhn3ahq3ikkz789r0";
    # })
    path
    (fetchpatch {
      url = "https://st.suckless.org/patches/bold-is-not-bright/st-bold-is-not-bright-20190127-3be4cf1.diff";
      sha256 = "1cpap2jz80n90izhq5fdv2cvg29hj6bhhvjxk40zkskwmjn6k49j";
    })
    # (fetchpatch {
    #   url = "https://st.suckless.org/patches/autocomplete/st-0.8.5-autocomplete-20220327-230120.diff";
    #   sha256 = "1y8acfqfyavkkgd2qwqxbwqfb9g5gq60kmhr5vas1zbmz5cf7q2j";
    # })

    # render wide glyphs like icons added with Nerd Fonts correctly
    (fetchpatch {
      url = "https://st.suckless.org/patches/glyph_wide_support/st-glyph-wide-support-20220411-ef05519.diff";
      sha256 = "0rr5q54ag9j0zbq15mvzjxqkrna21jmabfghda3srbf6j4a92ac4";
    })
    # (fetchpatch {
    #   url = "https://st.suckless.org/patches/undercurl/st-undercurl-0.8.4-20210822.diff";
    #   sha256 = "091ixzrcqzh156zmrmma8wj6js770l8fdx467rkndy3x6hnbrxj3";
    # })
  ];
})
# pkgs.st.overrideDerivation (old: {
#   src = ./.;
# })
