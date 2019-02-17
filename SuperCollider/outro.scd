~newHar = PatternProxy(Pn(0, 1));
(
~loc.source = Pn(420000, inf);
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~newHar.source = Pn(0, 1);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
// ~chirpsEcho2.play(quant: 1);
// u.stop;
// t.stop;
// ~chirps3.stop;
)
s.meter;

(
~chirpsEcho.play(quant: 1);
~beat5.stop;
)

~dur.source = Pn(0.005, inf);
(
~loc.source = Pn(420000, inf);
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(-5.midiratio, 1);
~newHar.source = Pn(14000, 1);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
)

~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(10.midiratio, 1);

(
~chirpsEcho.stop;
~chirpsEcho = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 2], inf),
    \freq, Pseq([
        Pseq([1396.91 * ~invHar * 8.midiratio], 16),
        Pseq([1108.73 * ~invHar * 9.midiratio], 16),
    ] * 0.5, inf),
    \amp, Pseq([Pgeom(1.9, 0.85, 16)], inf),
	\pan, Pwhite(-0.5, 0.5, inf),
    \sus, 0.25,
    \out, [~volumeBus, 0]
).play();
~chirpsEcho.stop;
~chirpsEcho.reset;
~chirpsEcho.play(quant: 1);
)

(
~chirpsEcho2.stop;
~chirpsEcho2 = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 2] * 4, inf),
    \freq, Pseq([
        Pseq([1396.91 * ~har * 0.midiratio], 2),
        Pseq([1108.73 * ~invHar * 0.midiratio], 2),
    ], inf) * Pseq([Pn(0.5, 4), Pn(0.25, 4), Pn(0.125, 4), Pn(0.125, 4) * 5.midiratio], inf),
    \amp, Pseq([Pgeom(2.125, 0.5, 4)], inf) * 0.75,
    \sus, 2.25,
    \atk, 0.01,
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~reverbBus, 0]
).play();
~chirpsEcho2.stop;
~chirpsEcho2.reset;
)

(
~chirpsEcho3.stop;
~chirpsEcho3 = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 2] * 2, inf),
    \freq, Pseq([
        Pseq([1396.91 * ~har * 12.midiratio], 4),
        Pseq([1108.73 * ~invHar * 12.midiratio], 4),
    ], inf) * Pseq([0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25], inf) * 0.5,
    \amp, Pseq([Pgeom(0.125, 1.7, 4)], inf),
    \sus, 2.25,
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~reverbBus, 0]
).play(quant: 1, timingOffset: 0.125);
)

(
~chirpsEcho4.stop;
~chirpsEcho4 = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 2, 0.125] * 2, inf),
    \freq, Pseq([
        Pseq([1396.91 * ~har * -12.midiratio], 4),
        Pseq([1108.73 * ~invHar * 7.midiratio], 4),
    ], inf) * Pseq([0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25], inf) * 0.5,
    \amp, Pseq([Pgeom(0.125, 1.7, 4)], inf),
    \sus, 3.25,
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~reverbBus, 0]
).play(quant: 1, timingOffset: 0.125);
)


(
~chirpsEcho3.stop;
~chirpsEcho4.stop;
)

(
~mandoFin6.stop;
~mandoFin6 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([1], inf),
    \spos, 160000,
    \rate, Pseq([1 * ~har * -2.midiratio], inf),
    \amp, Pseq([Pgeom(1, 0.75, 8)], inf),
	\pan, Pwhite(-0.75, 0.75, inf),
    \buf, ~mando,
    \rel, 2,
    \out, [~reverbBus, 0]
).play(quant: 1);
)

(
~mandoFin7.stop;
~mandoFin7 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([0.5], inf),
    \spos, Pseq([180000 + ~newHar], inf),
    \rate, Pseq([1 * 3.midiratio], inf),
    \amp, Pseq([Pgeom(1, 0.75, 8)] * 0.5, inf),
	\pan, Pwhite(-0.75, 0.75, inf),
    \buf, ~mando,
    \rel, 0.5,
    \out, [~reverbBus, 0]
).play(quant: 1);
)