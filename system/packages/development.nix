{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # C / C++
    gcc
    clang
    clang-tools
    libclang
    libgccjit

    # Rust
    rustup

    # Python & tooling
    pypy3
    uv

    # Diagramming
    graphviz

    # Electronics / simulation
    simulide_1_2_0
    arduino-ide

    # LaTeX & Ontology / Knowledge Graph tools
    texliveFull
    protege

    # AI & LLM development tools
    antigravity-cli
    antigravity-ide
    claude-code
  ];
}
