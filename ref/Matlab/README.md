Matlab model
============

Koivumaki が作成したものを van den Brink が改変して atriapace に収録していたものをベースにしている。

Usage
-----
* Matlabフォルダにパスを通す。（フォルダを選択してコンテクストメニューから `パスに追加` > `選択したフォルダ`）
* コマンドウィンドウで以下を実行

``` コマンドウィンドウ
>> run_1_AP
```

* 完了すると、`pacing_1AP.dat`がつくられ、計算結果をプロットした Figure 1〜4 のウィンドウが開く。

Files
-----
* `run_1_AP.m`
  * 具体的なパラメータを与えてシミュレーションを実行する手続を記述。
  * `run_1_AP` を実行すれば結果を得られる。

* `main_human_atrial.m`
  * シミュレーションの実行手続をまとめた関数を記述。どのモデルを読み込んで、どんな計算をし、その結果をどう保存、可視化するかの手続が書かれている。
  * `run_1_AP.m` から呼ばれる。

* `dy_human_atrial_PLoS_2014.m`
  * モデルの内容を記述。
  * `main_human_atrial.m` から呼ばれる。

* `stimcreator.m`
  * 外部刺激の時系列データを生成する。
  * `run_1_AP.m` から呼ばれる。

* `plot_human_atrial.m`
  * 計算結果をグラフにプロットする手続を記述。
  * `main_human_atrial.m` から呼ばれる。

* `y0_ss_BCL_1000_cAF.dat`
* `y0_ss_BCL_1000_nSR.dat`
  * atriapace に収録されていたデータファイル
  * 初期値を収めている。
  * `run_1_AP.m` から呼ばれる。

* `pacing_1AP_nSR-210316a.dat`
* `pacing_1AP_nSR-210316a.tsv`
* `fig1-pacing_1AP_nSR-210316a.fig`
* `fig1-pacing_1AP_nSR-210316a.pdf`
* `fig2-pacing_1AP_nSR-210316a.fig`
* `fig2-pacing_1AP_nSR-210316a.pdf`
* `fig3-pacing_1AP_nSR-210316a.fig`
* `fig3-pacing_1AP_nSR-210316a.pdf`
* `fig4-pacing_1AP_nSR-210316a.fig`
* `fig4-pacing_1AP_nSR-210316a.pdf`
  * `run_1_AP.m` の実行結果を保存したファイル。
  * `.dat` はMatlabのデータファイル。（スペース区切り）
  * `.fig` はMatlabの図版ファイル。

* `pacing_1AP_ss_BCL_1000_cAF.dat`
* `pacing_1AP_ss_BCL_1000_nSR.dat`
  * atriapace に収録されていたデータファイル
  * シミュレーション結果を収めている。

* `README.md`
  * このファイル
