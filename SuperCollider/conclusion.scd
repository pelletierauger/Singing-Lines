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
~beat6.stop;
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
~beat3.stop;
~beat4.stop;
)


(
~highChirp = Routine.new({ 
    Synth.new(\pulse, [\freq, 3322.44 * -14.midiratio, \amp, 7]); 
});
)

~highChirp.play(quant: 1);
~highChirp.reset;
(
// i = Synth.new(\pulse, [\freq, 3322.44 * -14.midiratio, \out, ~reverbBus]);
i = Synth.new(\pulse, [\freq, 3322.44 * -14.midiratio, \amp, 7]);
// ~highChirp.play(quant: 0.5);
p.stop;
~beat5.stop;
~vinyl.set(\trig, 0);
u.stop;
t.stop;
)

~mic.free;