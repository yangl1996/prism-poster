set term tikz size 26.0,16 font ',24'
set output "compare-fig.tex"
set border linewidth 2.5
set logscale y
set logscale x
set xlabel "Latency (s)" offset 0,0.5,0
set xrange [1:]
set ylabel "Throughput (tps)" offset -1,0,0
set format y "$10\^%T$"
set key left bottom box linewidth 3.0
set label '$\beta=20\%$' at 6,1500 right 
set label '$\beta=20\%$' at 170,100 right 
set label '$\beta=33\%$' at 820,10 right 
plot "algorand-faster-frontier.txt" using 6:7 with linespoints lc 1 ps 4.0 lw 3.5 title "Algorand", \
     "bitcoin-faster.txt" using 5:6 with linespoints lc 2 pt 2 ps 4.0 lw 3.5 title "Longest Chain", \
     "bitcoin-secure.txt" using 5:6 with linespoints lc 2 pt 2 ps 4.0 lw 3.5 notitle, \
     "prism-secure.txt" using 4:5:(sprintf("$\\\\beta=%02d\\\\%$", $2 * 100)) with labels point ps 5 lc 7 lw 5 right offset -0.7,-0.7 rotate by 45 title "Prism"
