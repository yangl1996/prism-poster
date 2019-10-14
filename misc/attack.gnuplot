set term tikz size 17.0,10.5 font ',24'
set border 15 linewidth 2.5
set output "attack-fig-censor.tex"
set xlabel "Adv. Fraction"
set xrange [0:25]
set xtics 0, +5
set format x "$%g\\%%$"
set ylabel 'Throughput ($\times 10^4$ tps)' offset -1,0,0
set yrange [40000:80000]
set ytics 40000, +10000 nomirror
set format y "$%.0t$"
#set y2label "Confirmation Latency (s)"
set y2label
set y2range [0:120]
set y2tics 30, +30 nomirror
set key left bottom nobox
plot "attack-censor.txt" using 1:3 with linespoints lw 3.5 ps 3.5 title "Throughput" axis x1y1, \
     "attack-censor.txt" using 1:2 with linespoints lw 3.5 ps 3.5 title "Latency" axis x1y2

set output "attack-fig-balancing.tex"
set xlabel "Adv. Fraction"
set xrange [0:25]
set xtics 0, +5
set format x "$%g\\%%$"
#set ylabel 'Throughput ($\times 10^4$ tps)' offset -1,0,0
set ylabel
set yrange [40000:90000]
set ytics 40000, +10000 nomirror
set format y "$%.0t$"
set y2label "Confirmation Latency (s)"
set y2range [0:3000]
set y2tics nomirror autofreq
#set y2tics add ("2600" 2600)
#set log y2
#set key left center box
set key at 1,46000 nobox
set label 'Longest Chain Latency' at second 25, 2780 right
set arrow from second 0, 2600 to second 25, 2600  lc 2 lw 4.5 dt 3 nohead front
plot "attack-balance.txt" using 1:3 with linespoints lw 3.5 ps 3.5 title "Throughput" axis x1y1, \
     "attack-balance.txt" using 1:2 with linespoints lw 3.5 ps 3.5 title "Latency" axis x1y2

