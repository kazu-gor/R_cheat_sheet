# R言語とは
R 言語は，Ross Ihaka 氏と Robert Gentleman 氏によって開発されたフリーの統計解析ソフト ウェアです.オープンソースであるため，多くのユーザーによって機能が拡張されています.

# R言語のチートシート

## 代入 `<-`

### 説明

任意の変数に値を割り当てる(代入する)．

`<-` はR言語では左向きの矢印を意味している．

### コード例

```
  meant <- 4.6
```

## ベクトル化 `c()`

### 説明

`,`で区切られた*n*個の数字を関数c()に入力すると，*n*個の数字を成分とする*n*次元ベクトルが1つ返される．

複数のデータを1つの変数に代入するときに使用するとよい．

### コード例

```
meant <- c(4.6, 5.6, 6.1, 6.1, 6.1, 6.8, 3.3, 0.2, 0.9, 2.5,           3.4, 3.2, 5.5, 7.5, 9.3, 8.6, 6.8, 4.6, 4.1, 4.7, 7.2, 8.5,           8.6, 8.3, 10.1, 12.1, 11.6, 8.6, 3.8, 4.8, 7.7)
```

## `summary()`

### 説明

データの最小値，第一四分位数，標本中央値，標本平均値，第三四分位数，最大値を一度に求める事ができる．

### コード例

```
summary(meant)
```

出力

```
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.  0.200   4.350   6.100   6.168   8.400  12.100
```

## 標本平均 `mean()`

### 説明

データの標本平均を求めることができる.

### コード例

```
mean(meant)
```

出力

```
[1] 6.167742
```

## 標本不変分散 `var()`

### 説明

データの不変分散を求めることができる．

### コード例

```
var(meant)
```

出力

```
[1] 8.160258
```

## ヒストグラム `hist()`

### 説明

データからヒストグラムを描画する．

ヒストグラムは度数分布表をそのままグラフに示したものである．その形によって確率密度関数の大雑把な形を質得ると考えることができる．つまり，データが連続分布からの標本と想定されるときに，その確率密度関数の概要をヒストグラムによって推定している．

### コード

```
hist(meant)
```

出力

```

```

## 箱ひげ図 `boxplot()`

### 説明

四分位範囲，第一四分位数，第三四分位数，標本中央値，四分位範囲，最大値，最小値を描画することができる．

また，オプションを指定せず実行すると，自動で外れ値を検出して除外して状態でプロットしてくれる．この場合の外れ値は，箱の端から四分位範囲の1.5倍以内の範囲に入らないデータを意味する．ちなみに，この外れ値に絶対的な意味はない．

### コード

```
boxplot(meant, range=0)
```

## テキストファイルを読み込む `read.table()`

表のように文字や数字が並んでいるテキストファイルを読み込んで，データフレームという構造をもつものに変換する関数．

### option

`header`:第一行目が見出しであることを示す．bool値

### code

```
example <- read.table(FILE_PATH, header=T)
```

## データを割り当てる `attach()`

データフレームを`header`名のデータとして扱うことができる．

### code

```
attach(example)
```
## 標本共分散 `cov()`

2変量間の標本共分散を算出する．

### code
```
cov(col1, col2)
```
## 標本相関係数 `cor()`

2変量間の標本相関係数を算出する．

### code
```
cor(col1, col2)
```

## 散布図 `plot()`

2変数に対する散布図をプロットする．

### code
```
plot(col1, col2)
```

## 線形モデル(linear model)を定義する関数 `lm()`

### code
`col1`を`col2`の1次関数で説明する．
```
lm(col1~col2)
```
`col1`を２つの説明変数`col2`, `col3`を用いた重回帰モデルで解析できる．
```
lm(col1~col2+col3)
```

## 各ペアに関する散布図を一度に描く `pairs()`

```R
pairs(data)
```

## 3次元散布図
1. パッケージの読み込み
2. "Rcmdr"を選択
3. 「アクティブデータセット」で対象のデータを選択
4. 「グラフ」の「3次元グラフ」から「3次元散布図」を選択する．
5. メニューから目的変数１つ，説明変数を2つ設定する．

## 棒グラフ `barplot()`

### option
`space`: 棒の間隔を調整する．
`color`: 色を指定する．

### code
option指定なし
```
barplot(data)
```
棒の間隔，色を指定
```
barplot(data, space=0.7, col="red")
```

## 折れ線グラフ `plot(type="l")`
`type` optionを指定して折れ線グラフを描画する．
### code
```
plot(col1, col2, type="l")
```

## 列ベクトルを結合 `cbind()`

### code
```
new_data <- cbind(col1, col2, col3)
```

## データ行列を折れ線グラフで表示 `matplot(type="l")`

### option

`type`: `"l"`で折れ線グラフを指定
`lwd`: 線の太さを指定

### code
```
matplot(col1, type="l", lwd=3)
```
## 一様乱数をn個生成 `runif(n)`
(0,1)区間上の一様乱数をn個生成し，1つのベクトルとして返す関数

### code
```
data <- runif(n)
```

## ベクトルの成分の和を返す関数 `sum()`

### code
```
s <- sum(data)
```

## 円グラフを描画する関数 `pie()`

### code
```
pie(data)
```
## データをトレンド（傾向線）・周期成分・誤差の3つに分解 `stl(s.window="prriodic)`

### code
```
plot(stl(kion, s.window="periodic"))
```

## PDF形式でグラフを保存 `dev.copy2pdf()`

### code
```
boxplot(data, range=0)
dev.copy2pdf()
```


























