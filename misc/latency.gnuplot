set term tikz size 16.0,9.8 font ',24'
set output "latency-fig.tex"
set border 3 linewidth 2.5
set logscale y
set ytics ('$10^0$' 1, '$10^{-2}$' 0.01, '$10^{-4}$' 0.0001, '$10^{-6}$' 0.000001) nomirror
set xlabel "$k$" offset 0,0.5,0
set xrange [0:50]
set xtics 10, +10 nomirror
set xtics add ("$2$" 2)
set yrange [0.000001:1]
set ylabel "Attack Possibility" offset -1,0,0
set format y "$10\^{%T}$"
set key right top nobox
plot "latency.data" using 3:1 with lines lc 2 lw 3.5 title "LC", \
     "latency.data" using 2:1 with lines lc 7 lw 3.5 title "Prism"
