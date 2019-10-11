set term tikz size 16.0,9.8 font ',24'
set output "throughput-fig.tex"
set border 3 linewidth 2.5
set ylabel "Adv. Fraction" offset -1,0,0
set ytics 0, +25 nomirror
set xlabel "Bandwidth Utilization" offset 0,0.5,0
set logscale x
set xrange [0.001:1]
set yrange [0:50]
set xtics (0.001, 0.01, 0.1, 1) nomirror
set format y "$%g\\%%$"
set format x "$10\^{%T}$"
set key left bottom nobox
lc(x) = 100 / (5 * x + 2)
p(x) = 50
plot lc(x) with lines lc 2 lw 3.5 title "LC", \
     p(x) with lines lc 7 lw 3.5 title "Prism"
