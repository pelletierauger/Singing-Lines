(
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(-2.midiratio, 1);
)

(
~har.quant = 1;
~invHar.quant = 1;
)
(
~har.source = Pn(-7.midiratio, 1);
~invHar.source = Pn(-7.midiratio, 1);
~toOSC.sendMsg("/newcolor", 0);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
)

(
p.stop;
~mando1.stop;
~beat1.stop;
)


// Fade out 1
(
~mando1.stop;
~beat1.stop;
~beat2.stop;
~beat6.stop;
~toOSC.sendMsg("/invertPalette", 0);
)

(
k.stop;
~beat1.stop;
~beat2.stop;
~beat3.stop;
~beat4.stop;
~beat5.stop;
)


// Fade out 2
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
// i = Synth.new(\pulse, [\freq, 3322.44 * -14.midiratio, \amp, 7]);
// ~highChirp.play(quant: 0.5);
p.stop;
~beat1.stop;
~beat2.stop;
~beat5.stop;
~vinyl.set(\trig, 0);
u.stop;
t.stop;
~chirps3.stop;
// ~mandoFin.stop;
// ~mandoFin2.stop;
// ~mandoFin3.stop;
// ~mandoFin4.stop;
~mandoFin6.stop;
~mandoFin7.stop;
~chirpsEcho.stop;
~chirpsEcho2.stop;
// Pbind(
//     \instrument, \pulse,
// 	\dur, Pseq([0.125 * 2], inf),
//     \freq, Pseq([
// //         Pseq([1396.91 * ~invHar * 8.midiratio], 16),
//         Pseq([1108.73 * ~invHar * 4.midiratio], 16),
//     ] * 1, inf),
//     \amp, Pseq([Pgeom(1.5, 0.75, 64)], 1),
// 	\pan, Pwhite(-0.5, 0.5, inf),
//     \sus, 0.25,
//     \out, [~volumeBus, 0]
// ).play(quant: 0.5);
// Pbind(
//     \instrument, \pulse,
// 	\dur, Pseq([0.125 * 2], inf),
//     \freq, Pseq([
// //         Pseq([1396.91 * ~invHar * 8.midiratio], 16),
//         Pseq([1108.73 * ~invHar * 4.midiratio], 16),
//     ] * 2, inf),
//     \amp, Pseq([Pgeom(1.5, 0.75, 64)], 1) * 0.125,
// 	\pan, Pwhite(-0.5, 0.5, inf),
//     \sus, 0.25,
//     \out, [~volumeBus, 0]
// ).play(quant: [0.5, 0.125]);
)
)

~mic.free;

(
Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 2], inf),
    \freq, Pseq([
//         Pseq([1396.91 * ~invHar * 8.midiratio], 16),
        Pseq([1108.73 * ~invHar * 5.midiratio], 16),
    ] * 1, inf),
    \amp, Pseq([Pgeom(1.9, 0.85, 64)], 1),
	\pan, Pwhite(-0.5, 0.5, inf),
    \sus, 0.25,
    \out, [~volumeBus, 0]
).play(quant: 1);
)