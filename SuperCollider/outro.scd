
(
~loc.source = Pn(420000, inf);
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
)
(
~loc.source = Pn(420000, inf);
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(-5.midiratio, 1);
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
        Pseq([1396.91 * ~har * 12.midiratio], 4),
        Pseq([1108.73 * ~invHar * 12.midiratio], 4),
    ] * 0.5, inf),
    \amp, Pseq([Pgeom(2.125, 0.5, 4)], inf),
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~volumeBus, 0]
).play(quant: 1);
)

(
~chirpsEcho2.stop;
~chirpsEcho2 = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 4], inf),
    \freq, Pseq([
        Pseq([1396.91 * ~har * 0.midiratio], 2),
        Pseq([1108.73 * ~invHar * 0.midiratio], 2),
    ], inf) * Pseq([0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25], inf),
    \amp, Pseq([Pgeom(2.125, 0.5, 4)], inf),
    \sus, 2.25,
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~reverbBus, 0]
).play(quant: 1);
)

(
~chirpsEcho3.stop;
~chirpsEcho3 = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 2], inf),
    \freq, Pseq([
        Pseq([1396.91 * ~har * 12.midiratio], 4),
        Pseq([1108.73 * ~invHar * 12.midiratio], 4),
    ], inf) * Pseq([0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25], inf),
    \amp, Pseq([Pgeom(1.125, 0.5, 4)], inf),
    \sus, 1.25,
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~reverbBus, 0]
).play(quant: 1, timingOffset: 0.125);
)