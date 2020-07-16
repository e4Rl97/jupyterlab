FROM jupyter/datascience-notebook

RUN pip install --upgrade pip
RUN pip install jupyterlab
RUN jupyter serverextension enable --py jupyterlab

### Jupyterlab 拡張機能
# Variable Inspector
RUN jupyter labextension install @lckr/jupyterlab_variableinspector
# Table of Contents
RUN jupyter labextension install @jupyterlab/toc

### settings
## prepare settings ※ ここのディレクトリはjupyterlabのSettingsのAdvanced Setting Editorを参照する
RUN mkdir -p /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension
RUN mkdir -p /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/notebook-extension
## user-settings ※ prepare settingsでディレクトリを生成していないとerror
# 黒背景
RUN echo '{"theme":"JupyterLab Dark"}' > \
  /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
# 行番号表示
RUN echo '{"codeCellConfig": {"lineNumbers": true}}' > \
  /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/notebook-extension/tracker.jupyterlab-settings
