(
SynthDef(\pulse, {
    arg freq = 440, pan = 0, out = 0, amp = 1, sus = 0.125, atk = 0.001;
    var sig, env;
    sig = Impulse.ar(0.1, mul: 0.4)!2;
    env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [atk, sus * 1.5, 2]), doneAction: 2);
    sig = Ringz.ar(sig, [freq, freq + 2], sus);
    sig = sig * env * 1.2 * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
	Out.ar(out, sig);
}).add;
)

(
t.stop;
t = Pbind(
    \instrument, \pulse,
    \dur, Pseq([0.25, 0.25, 0.5, 0.5, 0.5, 0.125, 0.125], inf),
    \freq, Pseq([
        1396.91 * ~har,
        1108.73 * ~invHar,
        1661.22 * ~har
    ], inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \amp, 2,
    \out, [~volumeBus, 0]
).play(quant: [1, 0.5]);
~toOSC.sendMsg("/blurScalar", 1);
)

(
u.stop;
u = Pbind(
    \instrument, \pulse,
    \dur, Pseq([0.125 * 8], inf),
    \freq, Pseq([
        415.30 * ~har * 2,
        349.23 * ~invHar * 2,
        277.18 * ~har * 2,
        69.30 * ~har * 8 * 4.midiratio,
        415.30 * ~har * 2,
        349.23 * ~invHar * 2,
        277.18 * ~har * 2 * 2.midiratio,
        69.30 * ~har * 8 * 0.midiratio
    ],
    inf),
    \pan, Pwhite(-0.5, 0.5, inf),
    \amp, 3,
    \out, [~volumeBus, 0]
).play(quant: 1);
)

(
~chirpsHar = PatternProxy(Pseq([
    1396.91 * 5.midiratio,
    1108.73 * 5.midiratio,
], inf));
)
(
~chirps3.stop;
~chirps3 = Pbind(
    \instrument, \pulse,
	\dur, Pseq([0.125 * 0.5], inf),
    \freq, ~chirpsHar,
	\pan, Pwhite(-0.5, 0.5, inf),
    \amp, 0.5,
    \out, [~volumeBus, 0]
).play(quant: 1);
)

(
~startChirpsLow = {
    ~chirpsLowSpeed = PatternProxy(Pseq([1], inf));
    ~chirpsLowSpeed.quant = 1;
    ~chirpsLowSus = PatternProxy(Pseq([2], inf));
    ~chirpsLowSus.quant = 1;
    ~chirpsLowFreqs = PatternProxy(Pseq([
        415.30 * ~har * 2,
        349.23 * ~invHar * 2,
        277.18 * ~har * 2,
        69.30 * ~har * 8 * 4.midiratio,
        415.30 * ~har * 2,
        349.23 * ~invHar * 2,
        277.18 * ~har * 2 * 2.midiratio,
        69.30 * ~har * 8 * 0.midiratio
    ] * 0.25, inf));
    ~chirpsLowFreqs.quant = 1;
    ~chirpsLow.stop;
    ~chirpsLow.reset;
    ~chirpsLow = Pbind(
        \instrument, \pulse,
        \dur, ~chirpsLowSpeed,
        \freq, ~chirpsLowFreqs,
        \atk, 0.02,
        \sus, ~chirpsLowSus,
        \pan, Pwhite(-0.5, 0.5, inf),
        \amp, 3,
        \out, [~volumeBus, 0]
    ).play(quant: [1, 0.5]);
};
)

(
// Petit jour
// TempoClock.default.sched(1, {
    ~har.source = Pn(0.midiratio, 1);
    ~invHar.source = Pn(0.midiratio, 1);
    ~toOSC.sendMsg("/getPalette", 0);
    ~toOSC.sendMsg("/invertPalette", 0);
    ~chirpsHar.source = Pseq([
        1396.91 * 5.midiratio,
        1108.73 * 5.midiratio,
    ], inf);
    ~moreEnergy.value;
// })
)
// TempoClock.default.clear;
(
// Petit soir
// TempoClock.default.sched(1, {
    ~har.source = Pn(-2.midiratio, 1);
    ~invHar.source = Pn(-2.midiratio, 1);
    ~toOSC.sendMsg("/getPalette", 0);
    ~toOSC.sendMsg("/invertPalette", 0);
    ~chirpsHar.source = Pseq([
        1396.91 * 5.midiratio,
        1108.73 * 12.midiratio,
    ], inf);
    ~startChirpsLow.value;
// ~moreEnergy.value;
// })
)

(
~energyIndex = 0;
~moreEnergy = {
    if (~energyIndex == 0, {
        ~chirpsLow.stop;
        ~chirpsLow.reset;
        ~chirpsLowSpeed.source = Pseq([1] * 0.5, inf);
        ~chirpsLowFreqs.source = Pn(Pseq([
            415.30 * ~har * 2,
            349.23 * ~invHar * 2,
            277.18 * ~har * 2,
            69.30 * ~har * 8 * 4.midiratio,
            415.30 * ~har * 2,
            349.23 * ~invHar * 2,
            277.18 * ~har * 2 * 2.midiratio,
            69.30 * ~har * 8 * 0.midiratio
        ].stutter(2) * 0.25, inf) * Pseq([1, 0.5], inf), inf);
        ~chirpsLow.play();
    });
    if (~energyIndex == 1, {
        ~chirpsLowSpeed.source = Pseq([1] * 0.25, inf);
        ~chirpsLowFreqs.source = Pn(Pseq([
            415.30 * ~har * 2,
            349.23 * ~invHar * 2,
            277.18 * ~har * 2,
            69.30 * ~har * 8 * 4.midiratio,
            415.30 * ~har * 2,
            349.23 * ~invHar * 2,
            277.18 * ~har * 2 * 2.midiratio,
            69.30 * ~har * 8 * 0.midiratio
        ].stutter(4) * 0.25, inf) * Pseq([1, 0.5], inf), inf);
        ~chirpsLowSus.source = Pseq([1.5], inf);
    });
    if (~energyIndex == 2, {
        ~chirpsLowSpeed.source = Pseq([1] * 0.125, inf);
        ~chirpsLowFreqs.source = Pn(Pseq([
            415.30 * ~har * 2,
            349.23 * ~invHar * 2,
            277.18 * ~har * 2,
            69.30 * ~har * 8 * 4.midiratio,
            415.30 * ~har * 2,
            349.23 * ~invHar * 2,
            277.18 * ~har * 2 * 2.midiratio,
            69.30 * ~har * 8 * 0.midiratio
        ].stutter(8) * 0.25, inf) * Pseq([1, 0.5], inf), inf);
        ~chirpsLowSus.source = Pseq([1], inf);
    });
    ~energyIndex = ~energyIndex + 1;
    nil;
};
)
~energyIndex;

(
t.stop;
u.stop;
~chirpsLow.stop;
p.stop;
~chirps3.stop;
)