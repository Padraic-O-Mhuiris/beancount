{ pkgs, ... }:

let
  python = pkgs.python312;
  projectPath = "$HOME/accounts";
in pkgs.mkShell {
  packages = with pkgs; [ nixfmt-rfc-style python black pyright ruff-lsp ];

  shellHook = ''
    export PYTHONPATH=${"PYTHONPATH:+$PYTHONPATH:"}${projectPath}/plugins
  '';
}
