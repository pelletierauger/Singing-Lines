(
p.stop;
a = 400000;
p = Pbind(
	\instrument, \bpfbuff,
	\dur, Pseq([~dur], inf),
	\spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([1 * ~har, 1 * -7.midiratio, 1 * 5.midiratio, 1 * 12.midiratio * ~har], inf),
    \amp, Pseq([0.5], inf),
	\pan, Pwhite(-1, 1, inf)
).play;
)

~loc.source = Pn(712000, inf);
~loc.source = Pn(420000, inf);
~loc.source = Pn(730000, inf);
~loc.source = Pn(400000, inf);
~loc.source = Pn(320000, inf);
~loc.source = Pn(350000, inf);
~loc.source = Pn(370000, inf);
// ~loc.source;

~har.source = Pn(0.midiratio, 1);
~har.source = Pn(-2.midiratio, 1);

~invHar = PatternProxy(Pn(1, 1));
~invHar.source = Pn(0.midiratio, 1);



(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
)

(
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(10.midiratio, 1);
)


(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~loc.source = Pn(320000, inf);
)



(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~loc.source = Pn(370000, inf);
)

~malletOctave = PatternProxy(Pn(1, 1));
~malletOctave.source = Pn(4, 1);

s.record;
s.stopRecording;





~mando = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/La patate du dix-neuf Project/Samples/Recorded/0007 Mandoline 1.aif");
~mando = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/La patate du dix-neuf Project/Samples/Recorded/0003 Mandoline 2.aif");

~mando.numFrames;
~mando.bufnum;
~mando;

(
SynthDef(\mandoline, {
	arg buf = ~mando, rate = 1, spos = 0, pan = 1, amp = 1;
	var sig, env, lfo;
	env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [0.1, 0.15, 0.75]), doneAction: 2);
	sig = PlayBuf.ar(2, buf, rate * BufRateScale.ir(buf), startPos: spos);
	sig = sig * env;
    sig = sig * amp;
	sig = Balance2.ar(sig[0], sig[1], pan, 1);
	Out.ar(0, sig);
}).add;
)



(
m.stop;
m = Pbind(
	\instrument, \mandoline,
    // \dur, Pseq([0.5, 0.5, 0.25, 0.25], inf),
	\dur, Pseq([0.25, 0.25, 0.125, 0.125], inf),
    // \spos, 917440,
    // \spos, 1217440,

    // lower energy
    // \spos, 1717440,

        // lower energy
    // with the major chord, subtle shimmer
    \spos, 2417440,

            // lower energy
    // with the minor chord, dramatic
    // \spos, 3417440,

    // more dramatic ?
    // \spos, 4617440,

                // lower energy
    // \spos, 3817440,

    // \spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([0.35, 1.2 * ~invHar], inf),
    \amp, Pseq([~volMando], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando
).play(quant: 1);
)

~volMando = PatternProxy(Pn(1, 1));
~volMando.source = Pn(1.7, 1);


(
n.stop;
n = Pbind(
	\instrument, \mandoline,
    // \dur, Pseq([0.5, 0.5, 0.25, 0.25], inf),
	\dur, Pseq([0.25, 0.25, 0.125, 0.125], inf),
    // \spos, 917440,
    // \spos, 1217440,

    // lower energy
    // \spos, 1717440,

        // lower energy
    \spos, 2417440,

            // lower energy
    \spos, 3417440,

                // lower energy
    \spos, 4217440,

    // \spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([1.2 * ~invHar, 2.9, 4.65 * ~har], inf),
    \amp, Pseq([0.5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando
).play(quant: 1);
)



(
k.stop;
k = Pbind(
	\instrument, \mandoline,
    // \dur, Pseq([0.5, 0.5, 0.25, 0.25], inf),
	\dur, Pseq([0.25, 0.25, 0.125, 0.125], inf),
    // \spos, 917440,
    // \spos, 1217440,

    // lower energy
    \spos, 1717440,

        // lower energy
    // with the major chord, subtle shimmer
    // \spos, 2417440,

            // lower energy
    // with the minor chord, dramatic
    // \spos, 3417440,

    // more dramatic ?
    // \spos, 4617440,

                // lower energy
    // \spos, 3817440,

    // \spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([0.35, 1.2 * ~invHar], inf),
    \amp, Pseq([~volMando], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando
).play(quant: 1);
)