~newHar = PatternProxy(Pn(0, 1));
(
// L'heure dorée
~loc.source = Pn(420000, inf);
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~newHar.source = Pn(0, 1);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
// ~toOSC.sendMsg("/makeBlurrier", 1);
// u.stop;
// t.stop;
// ~chirps3.stop;
// ~chirpsLow.stop;
// ~beat5.stop;
)

(
// L'heure bleue
~loc.source = Pn(420000, inf);
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(-5.midiratio, 1);
~newHar.source = Pn(14000, 1);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
)

(
~chirpsEcho.stop;
~chirpsEcho = Pbind(
    \instrument, \fancypulse,
	\dur, Pseq([0.125 * 2], inf),
    \freq, Pseq([
        Pseq([1396.91 * ~invHar * 8.midiratio], 16),
        Pseq([1108.73 * ~invHar * 9.midiratio], 16),
    ] * 0.5, inf),
    \amp, Pseq([Pgeom(1.2, 0.85, 16)], inf) * ~globalAmp,
	\pan, Pwhite(-0.5, 0.5, inf),
    \sus, 0.25,
    \out, [~volumeBus, 0]
).play(quant: 1);
)

(
~chirpsEcho2.stop;
~chirpsEcho2 = Pbind(
    \instrument, \fancypulse,
	\dur, Pseq([0.125 * 2] * 4, inf),
    \freq, Pseq([
        Pseq([1396.91 * ~har * 0.midiratio], 2),
        Pseq([1108.73 * ~invHar * 0.midiratio], 2),
    ], inf) * Pseq([Pn(0.25, 4), Pn(0.125, 4), Pn(0.125, 4) * 5.midiratio], inf),
    \amp, Pseq([Pgeom(2.125, 0.5, 4)], inf) * 1.25 * ~globalAmp,
    \sus, 2.25,
    \atk, 0.15,
	\pan, Pwhite(-0.5, 0.5, inf),
    \out, [~reverbBus, 0]
).play(quant: 1);
)

(
~mandoFin6.stop;
~mandoFin6 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([1], inf),
    \spos, 160000,
    \rate, Pseq([1 * ~har * -2.midiratio], inf),
    \amp, Pseq([Pgeom(1, 0.75, 8)], inf) * ~globalAmp,
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
    \amp, Pseq([Pgeom(1, 0.75, 8)] * 0.5, inf) * ~globalAmp,
	\pan, Pwhite(-0.75, 0.75, inf),
    \buf, ~mando,
    \rel, 0.5,
    \out, [~reverbBus, 0]
).play(quant: 1);
)

//---------------------- Fading out -----------------------//

(
~amplitudeScalar = 1;
~fadeOut = {
        ~amplitudeScalar = ~amplitudeScalar - 0.05;
        ~globalAmp.source = Pn(~amplitudeScalar, inf);
//         ~vinyl.set(\ampScalar, ~amplitudeScalar);
        ~amplitudeScalar.postln;
        if (~amplitudeScalar > 0, {
            2;
        }, {
            nil;
        });
};
)

TempoClock.default.sched(2, {~fadeOut.value});

(
p.stop;
// ~vinyl.set(\trig, 0);
~chirpsEcho.stop;
~chirpsEcho2.stop;
~mandoFin6.stop;
~mandoFin7.stop;
)

s.numSynths;