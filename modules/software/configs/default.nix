{
imports = 
[
  ./doas.nix
  ./nixvim.nix
  ./zsh.nix
];

home-manager.users.dp0sk.imports = [
  ./vim.nix
];
}