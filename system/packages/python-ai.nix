# Python AI, Machine Learning & Deep Learning Environment
{ pkgs, ... }:
let
  pythonWithAiPackages = pkgs.python3.withPackages (ps: with ps; [
    # Core Data Science & ML
    numpy
    pandas
    matplotlib
    scipy
    scikit-learn

    # Deep Learning (PyTorch)
    torch
    torchvision
    torchaudio

    # NLP & Transformers / HuggingFace
    transformers
    accelerate
    datasets
    huggingface-hub

    # Interactive Notebooks
    jupyter
    jupyterlab
    notebook
    ipython
    ipykernel

    # Package Management for pip/virtualenvs (Unsloth, TRL, BitsAndBytes)
    pip
    virtualenv
    setuptools
    wheel
  ]);
in
{
  environment.systemPackages = [
    pythonWithAiPackages
  ];

  # Environment variables for Jupyter & HuggingFace
  environment.variables = {
    JUPYTER_CONFIG_DIR = "$HOME/.jupyter";
  };
}
