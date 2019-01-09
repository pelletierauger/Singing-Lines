(
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(-2.midiratio, 1);
)

(
~har.source = Pn(-7.midiratio, 1);
~invHar.source = Pn(-7.midiratio, 1);
~toOSC.sendMsg("/newcolor", 0);
)

(
p.stop;
~mando1.stop;
~beat1.stop;
)


(
~mando1.stop;
~beat1.stop;
~beat2.stop;
)

(
k.stop;
~beat1.stop;
~beat2.stop;
~beat3.stop;
~beat4.stop;
~beat5.stop;
)

(
p.stop;
~beat5.stop;
)

~mic.free;