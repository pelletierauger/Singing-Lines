// Initialize the Pattern Proxies
(
~dur = PatternProxy(Pn(0.005, inf));
~loc = PatternProxy(Pn(712000, inf));
~har = PatternProxy(Pn(0.midiratio, 1));
~invHar = PatternProxy(Pn(0.midiratio, 1));
~volMando = PatternProxy(Pn(0.1, 1));
)


(
p.stop;
a = 400000;
p = Pbind(
    \instrument, \bpfbuff,
    \dur, Pseq([~dur], inf),
    \spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([1 * ~har, 1 * -7.midiratio, 1 * 5.midiratio], inf),
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

~har = PatternProxy(Pn(1, 1));
~har.source = Pn(0.midiratio, 1);
~har.source = Pn(-2.midiratio, 1);

~invHar = PatternProxy(Pn(1, 1));
~invHar.source = Pn(0.midiratio, 1);

(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
// c.play(quant: 1);
// ~bea2.stop;
// ~bea4.stop;
)

(
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(10.midiratio, 1);
~bea2.play(quant: 0.5);
// ~bea4.play(quant: 1);
)


(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~loc.source = Pn(320000, inf);
// ~bea2.stop;
)


// Grand jour
(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~loc.source = Pn(370000, inf);
~bea3.play(quant: 0.5);
)

// Progressively brighter
~loc.source = Pn(Pseq([370000, 370000, 400000], inf), inf);
~loc.source = Pn(Pseq([370000, 400000], inf), inf);


~malletOctave = PatternProxy(Pn(1, 1));
~malletOctave.source = Pn(4, 1);


~mando = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/La patate du dix-neuf Project/Samples/Recorded/0007 Mandoline 1.aif");


// This is the right one :
~mando = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/La patate du dix-neuf Project/Samples/Recorded/0003 Mandoline 2.aif");

~mando.numFrames;
~mando.bufnum;
~mando;

(
SynthDef(\mandoline, {
    arg buf = ~mando, rate = 1, spos = 0, pan = 1, amp = 1, out = 0;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [0.1, 0.15, 0.75]), doneAction: 2);
    sig = PlayBuf.ar(2, buf, rate * BufRateScale.ir(buf), startPos: spos);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)



(
m.stop;
m = Pbind(
	\instrument, \mandoline,
    // \dur, Pseq([0.5, 0.5, 0.25, 0.25], inf),
	\dur, Pseq([0.25, 0.25, 0.125, 0.125], inf),
    // \dur, Pseq([1, 0.5, 0.25, 0.25], inf),
    // \spos, 917440,
    // \spos, 1217440,
    // lower energy
    // \spos, 1717440,
        // lower energy
    // with the major chord, subtle shimmer
    \spos, 2417440,
            // lower energy
//     with the minor chord, dramatic
    \spos, 3417440,
    // more dramatic ?
    // \spos, 4617440,
                // lower energy
    // \spos, 3817440,
    // \spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([0.35, 1.2 * ~invHar], inf),
    // \rate, Pseq([0.35], inf),
    \amp, Pseq([~volMando], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando,
//     \out, 0,
    \out, ~reverbBus
//     \out, ~volumeBus
).play(quant: 1);
)

~volMando.source = Pn(0.1, 1);


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
//     \spos, 3417440,

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


~beats = Array.new;
~folder = PathName.new("/Users/guillaumepelletier/Desktop/Dropbox/Art/p5/Singing-Lines/SuperCollider/samples/percussions/");

(
~folder.entries.do({
    arg path;
    ~beats = ~beats.add(Buffer.read(s, path.fullPath));
});
)
~beats[0].play;

(
SynthDef(\percu, {
    arg buf = ~beats[0], rate = 1, spos = 0, pan = 1, amp = 1;
    var sig, env, lfo;
    // env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [0.0001, 0.15, 0.75]), doneAction: 2);
    sig = PlayBuf.ar(2, buf, rate * BufRateScale.ir(buf), startPos: 0, doneAction: 2);
    // sig = sig * env;
    sig = sig * amp * 2;
    sig = Balance2.ar(sig[0], sig[1], 0, 1);
    Out.ar(~volumeBus, sig);
}).add;
)

(
c.stop;
c = Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25], inf),
    \spos, 1717440,
    \rate, Pseq([1], inf),
    \amp, Pseq([1, 0, 0, 0], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[0], ~beats[1], ~beats[2], ~beats[3]], inf),
).play(quant: 1);
)

(
~bea2.stop;
~bea2 = Pbind(
    \instrument, \percu,
    \dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([2], inf),
    \amp, Pseq([0, 0, 1, 1, 1], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[0], ~beats[1], ~beats[2], ~beats[2]], inf),
).play(quant: 1);
)


(
~bea3.stop;
~bea3 = Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([2], inf),
    \amp, Pseq([1], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[0]], inf),
).play(quant: 1);
)


(
~bea4.stop;
~bea4 = Pbind(
    \instrument, \percu,
    \dur, Pseq([0.25], inf),
    \spos, 1717440,
    \rate, Pseq([8], inf),
    \amp, Pseq([0, 4], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[2]], inf),
).play(quant: 1);
)