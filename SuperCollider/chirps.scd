(
SynthDef(\pulse, {
	arg freq = 440, pul1 = 1, pul2 = 1, pan = 0;
	var sig, mod, lp, sp, env;
    mod = SinOsc.kr(freq) * 3;
    // sp = abs(SinOsc.kr(0.1)) * 220;
	sig = Impulse.ar(0.1, mul: 0.4)!2;
    // sig2 = Impulse.ar(pul2, mul: 0.4)!2;
    env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [0.001, 0.15, 2]), doneAction: 2);
    // sig = sig + sig2;
    // sig = LPF.ar(sig, freq / 1);
    sig = Ringz.ar(sig, [freq, freq + 2 + mod], 0.125);
    sig = LPF.ar(in: sig, freq: [freq, freq+2], mul: 1, add: 0);
	// sig = sig * 1;
    sig = sig * env;
    // sig = sig * mod;
    sig = sig * 1.2;
    // sig = sig * amp;
    // sig = Pan2(sig, pan);
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
	Out.ar(0, sig);
}).add;
)


(
h.free;
h = Synth.new(\pulse, [\freq, 330]);
)

h.set(\freq, 220);
h.set(\pul2, 1.75);

i = Synth.new(\pulse, [\freq, 330]);
i.set(\freq, 220);
i.set(\pul2, 1.5);
i.free;

(
t.stop;
t = Pbind(
	\instrument, \pulse,
	\dur, Pseq([0.25, 0.25, 0.5, 0.5, 0.5, 0.125, 0.125], inf),
    \freq, Pseq([[550, 330, 110], [440, 330, 220], [330, 55]], inf),
    // \freq, [330, 220],
    // \amp, Pseq([4], inf),
    // \out, ~wahwahBus,
	// \spos, Pwhite(0, 592896, inf).round,
    // \rate, Pseq([1 * -11.midiratio, 1 * -4.midiratio, 1 * -16.midiratio], inf),
	\pan, Pwhite(-0.5, 0.5, inf)
).play;
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
    // \freq, [330, 220],
    // \amp, Pseq([1], inf),
    // \out, ~wahwahBus,
	// \spos, Pwhite(0, 592896, inf).round,
    // \rate, Pseq([1 * -11.midiratio, 1 * -4.midiratio, 1 * -16.midiratio], inf),
	\pan, Pwhite(-0.5, 0.5, inf)
).play(quant: 1);
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
        [69.30 * ~invHar * 16, 69.30 * ~har * 8]
    ],
    inf),
    // \freq, [330, 220],
    // \amp, Pseq([1], inf),
    // \out, ~wahwahBus,
	// \spos, Pwhite(0, 592896, inf).round,
    // \rate, Pseq([1 * -11.midiratio, 1 * -4.midiratio, 1 * -16.midiratio], inf),
	\pan, Pwhite(-0.5, 0.5, inf)
).play(quant: 1);
)



(
w.stop;
w = Pbind(
	\instrument, \pulse,
	\dur, Pseq([0.125 * 8], inf),
    \freq, Pseq([
        415.30 * ~har * 0.25,
       349.23 * ~har * 0.5,
        277.18 * ~har * 0.25,
    ],
    inf),
    // \freq, [330, 220],
    \amp, Pseq([1], inf),
    // \out, ~wahwahBus,
	// \spos, Pwhite(0, 592896, inf).round,
    // \rate, Pseq([1 * -11.midiratio, 1 * -4.midiratio, 1 * -16.midiratio], inf),
	\pan, Pwhite(-0.5, 0.5, inf)
).play(quant: 1);
)