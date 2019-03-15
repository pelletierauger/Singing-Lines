// Initialize the Pattern Proxies
(
~dur = PatternProxy(Pn(0.005, inf));
~loc = PatternProxy(Pn(712000, inf));
~har = PatternProxy(Pn(0.midiratio, 1));
~invHar = PatternProxy(Pn(0.midiratio, 1));
~mando1Amp = PatternProxy(Pn(0.05, 1));
~mando1Pos = PatternProxy(Pn(3417440, 1));
~beat1Amp = PatternProxy(Pseq([1, Rest(), Rest(), Rest()] * 0.8, inf));
~beat1Amp.quant = 1;
~globalAmp = PatternProxy(Pn(1, inf));
~amplitudeScalar = 1;
)

// Reset the Pattern Proxies
(
~dur.source = Pn(0.005, inf);
~loc.source = Pn(712000, inf);
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~mando1Amp.source = Pn(0.01, 1);
~mando1Pos.source = Pn(3417440, 1);
// ~beat1Amp.source = Pseq([1, 0, 0, 0], inf);
~beat1Amp.source = Pseq([1, Rest(), Rest(), Rest()] * 0.8, inf);
~toOSC.sendMsg("/blurScalar", 1);
~globalAmp.source = Pn(1, inf);
~amplitudeScalar = 1;
)


~beat1Amp.source = Pseq([1, Rest(), Rest(), Rest()] * 0.8, inf);
~beat1Amp.source = Pseq([1, Rest(), 3, 2] * 0.8, inf);

(
// ~beat1Amp.source = Pseq([1, 0, 2, 0], inf);
~beat1Amp.source = Pseq([1, Rest(), 3, Rest()], inf);
~beat5.reset;
~beat5.play(quant: 1);
// ~mando1.play(quant: 1);
)


~beat1.reset;
~beat1.play(quant: 1);
~beat1.stop;
~mando1.stop;
~mando1.play(quant: 1);
~mando1Amp.source = Pn(0.45, 1);
s.scope;
(
p.stop;
// ~vinyl = Synth.new(\vinylSynth, [\amp, 0.5, \spos, 500000]);
p = Pbind(
    \instrument, \bpfbuff,
    \dur, Pseq([~dur], inf),
    \spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
    \rate, Pseq([1 * ~har, 1 * -7.midiratio, 1 * 5.midiratio], inf),
    \amp, Pseq([0.5], inf) * 0.7 * ~globalAmp,
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

~beat1Amp.source = Pseq([1, 0, 0, 0], inf);

~beat1.play(quant: 1);
~mando1.play(quant: 1);

(
// Jour
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~toOSC.sendMsg("/newcolor", 0);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
// ~beat1.play(quant: 1);
// ~beat2.stop;
// ~beat4.stop;
// ~loc.source = Pn(Pseq([370000, 370000, 400000], inf), inf);
// ~loc.source = Pn(Pseq([400000], inf), inf);
// ~toOSC.sendMsg("/getPalette", "wild");
// ~toOSC.sendMsg("/getPalette", "darker-pastel-tornado");

// ~toOSC.sendMsg("/getPalette", "random2");
)

~toOSC.sendMsg("/getPalette", "wild-and-happy");

(
// Soir
~har.source = Pn(-2.midiratio, 1);
~invHar.source = Pn(10.midiratio, 1);

// ~beat1Amp.source = Pseq([1, Rest(), 3, 2] * 0.8, inf);
// ~beat2.reset;
// ~beat2.play(quant: 1);

// ~toOSC.sendMsg("/newcolor", 0);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/invertPalette", 0);
// ~beat4.play(quant: 1);
// ~loc.source = Pn(Pseq([370000, 400000], inf), inf);
//             ~toOSC.sendMsg("/blurScalar", 3);
// ~toOSC.sendMsg("/getPalette", "pastel-tornado");

// ~toOSC.sendMsg("/getPalette", "random6");
)


(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~loc.source = Pn(320000, inf);
~toOSC.sendMsg("/getPalette", 0);
~toOSC.sendMsg("/blurScalar", 3);
~toOSC.sendMsg("/invertPalette", 0);
// ~bea2.stop;
)


// Grand jour
(
~har.source = Pn(0.midiratio, 1);
~invHar.source = Pn(0.midiratio, 1);
~loc.source = Pn(370000, inf);
~beat3.reset;
~beat3.play(quant: 1);
~toOSC.sendMsg("/newcolor", 0);
~mando1Pos.source = Pn(2417440, 1);
~mando1Amp.source = Pn(2.6, 1);
~toOSC.sendMsg("/blurScalar", 3);
~toOSC.sendMsg("/getPalette", "wild");
~toOSC.sendMsg("/invertPalette", 0);
)

// Progressively brighter
~loc.source = Pn(Pseq([370000, 370000, 400000], inf), inf);
~loc.source = Pn(Pseq([370000, 400000], inf), inf);


// Load the mandonline sample
~mando = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/La patate du dix-neuf Project/Samples/Recorded/0003 Mandoline 2.aif");

(
SynthDef(\mandoline, {
    arg buf = ~mando, rate = 1, spos = 0, pan = 1, amp = 1, out = 0, rel = 0.75;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [0.1, 0.15, rel]), doneAction: 2);
    sig = PlayBuf.ar(2, buf, rate * BufRateScale.ir(buf), startPos: spos);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(out, sig);
}).add;
)


(
~mando1.stop;
~mando1 = Pbind(
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
    \spos, Pseq([~mando1Pos], inf),
    \rate, Pseq([0.35, 1.2 * ~invHar], inf),
    // \rate, Pseq([0.35], inf),
    \amp, Pseq([~mando1Amp], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando,
//     \out, 0,
    \out, ~reverbBus
//     \out, ~volumeBus
).play(quant: 1);
~mando1.stop;
)

~mando1Pos.source = Pn(2417440, 1);
~mando1Amp.source = Pn(0.1, 1);
~mando1.play(quant: 1);

(
~beats = Array.new;
~folder = PathName.new("/Users/guillaumepelletier/Desktop/Dropbox/Art/p5/Singing-Lines/SuperCollider/samples/percussions/");
~folder.entries.do({
    arg path;
    ~beats = ~beats.add(Buffer.read(s, path.fullPath));
});
)

(
SynthDef(\percu, {
    arg buf = ~beats[0], rate = 1, spos = 0, pan = 1, amp = 1, out = ~volumeBus;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([1, 0], [0.5]), doneAction: 2);
    sig = PlayBuf.ar(2, buf, rate * BufRateScale.ir(buf), startPos: 0, doneAction: 2);
    sig = sig * env;
    sig = sig * amp * 2;
    sig = Balance2.ar(sig[0], sig[1], 0, 1);
    Out.ar(out, sig);
}).add;
)

(
SynthDef("kick", {arg out = 0, amp = 0.3, sinfreq = 60, glissf = 0.9, att = 0.01, rel = 0.45, pan = 0;
    var env, snd, ramp;
    env = Env.perc(att, rel, amp).kr(doneAction: 2);
    ramp = XLine.kr(
        start: sinfreq,
        end: sinfreq * glissf,
        dur: rel
    );
    snd = SinOsc.ar(freq: ramp, mul: env);
    snd = Pan2.ar(snd, pan);
    Out.ar(out, snd);
}).add;
)


(
~beat1.stop;
~beat1 = Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25], inf),
    \spos, 1717440,
    \rate, Pseq([1], inf),
    \amp, ~beat1Amp,
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[0], ~beats[1], ~beats[2], ~beats[3]], inf),
    \out, [~volumeBus, 0]
).play(quant: 1);
~beat1.stop;
~beat1.reset;
)

~beat1Amp.source = Pseq([1, Rest(), Rest(), Rest()], inf);
~beat1.play(quant: 1);


~beat1Amp.source = Pseq([1, Rest(), Rest(), Rest()] * 0.8, inf);
~beat1Amp.source = Pseq([1, Rest(), 3, 2] * 0.8, inf);
(
~beat1.stop;
~beat1 = Ppar([Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25], inf),
    \spos, 1717440,
    \rate, Pseq([1], inf),
    \amp, ~beat1Amp,
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[4], ~beats[1], ~beats[2], ~beats[3]], inf),
    \out, [~volumeBus, 0]
), Pbind(
    \instrument, \kick,
	\dur, Pseq([0.25, Rest(0.75)], inf),
    \att, 0.01,
    \rel, 0.32,
//     \sinfreq, 60,
    \sinfreq, 60,
    \glissf, 0.9,
    \amp, Pseq([1], inf) * 0.7,
//     \amp, 1,
    \out, [~volumeBus, 0]
)]).play(quant: 1);
~beat1.stop;
~beat1.reset;
)

~beat1.play(quant: 1);


(
~beat2.stop;
~beat2 = Pbind(
    \instrument, \percu,
    \dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([2], inf),
    \amp, Pseq([0, 0, 1.5, 1.5, 1.5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[4], ~beats[1], ~beats[2], ~beats[2]], inf),
    \out, [~volumeBus, 0]
).play(quant: 1);
~beat2.stop;
~beat2.reset;
)

~beat2.reset;
~beat2.play(quant: 1);

(
~beat3.stop;
~beat3 = Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([2], inf),
    \amp, Pseq([1], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[0]], inf),
    \out, [~volumeBus, 0]
).play(quant: 1);
~beat3.stop;
~beat3.reset;
)


(
~beat4.stop;
~beat4 = Pbind(
    \instrument, \percu,
    \dur, Pseq([0.25], inf),
    \spos, 1717440,
    \rate, Pseq([8], inf),
    \amp, Pseq([0, 2], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[2]], inf),
).play(quant: 1);
~beat4.stop;
~beat4.reset;
)

(
~beat5.stop;
~beat5 = Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([0.125, 0.25], inf),
    \amp, Pseq([3], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[4]], inf),
    \out, 0
).play(quant: 1);
~beat5.stop;
~beat5.reset;
)

~beat5.play(quant: 1);



(
~beat5.stop;
~beat5 = Ppar([Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([0.125, 0.25], inf),
    \amp, Pseq([3], inf) * 0.3,
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[4]], inf),
    \out, 0
), Pbind(
    \instrument, \kick,
	\dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \att, 0.01,
    \rel, 0.22,
//     \sinfreq, 60,
    \sinfreq, Pseq([60, 60 * 2.midiratio], inf),
    \glissf, 0.9,
    \amp, Rest(),
    \amp, 1 * 0.45,
    \out, 0
)], inf).play(quant: 1);
~beat5.stop;
~beat5.reset;
)

s.meter;
~beat5.play(quant: 1);

(
~beat6.stop;
~beat6 = Pbind(
    \instrument, \percu,
	\dur, Prand([1.25, 1.125, 1, 2, 2.5], inf),
    \spos, 1717440,
//     \rate, Pseq([1], inf),
    \rate, Prand([1, 1.25, 1.125, 1, 0.9], inf),
    \amp, Prand([2, 1.5, 1.7, 1.9, 1.8], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[2]], inf),
    \out, [~volumeBus, 0]
).play(quant: 1);
// ~beat6.stop;
// ~beat6.stop;
)



(
~mandoFin.stop;
~mandoFin = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([0.25, 0.25, 0.125, 0.125], inf),
    \spos, 210000,
    \rate, Pseq([1.2 * 0.midiratio], inf),
    \amp, Pseq([1.5], inf),
	\pan, Pwhite(-1, 1, inf)
    \buf, ~mando
).play(quant: 1);
)

(
~mandoFin2.stop;
~mandoFin2 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([0.25, 0.25, 0.125, 0.125], inf),
    \spos, 240000,
    \rate, Pseq([1.2 * 0.midiratio], inf),
    \amp, Pseq([2.5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando
).play(quant: 1);
)

(
~mandoFin3.stop;
~mandoFin3 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([0.25, 0.125, 0.125], inf),
    \spos, 260000,
    \rate, Pseq([1.2 * 0.midiratio], inf),
    \amp, Pseq([3.5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando
).play(quant: 1);
)

(
~mandoFin4.stop;
~mandoFin4 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([0.5], inf),
    \spos, 420000,
    \rate, Pseq([1 * ~har * -2.midiratio], inf),
    \amp, Pseq([3.5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando,
    \rel, 4
).play(quant: 1);
)

(
~mandoFin5.stop;
~mandoFin5 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([0.5], inf),
    \spos, 470000,
    \rate, Pseq([1 * ~invHar * -2.midiratio], inf),
    \amp, Pseq([3.5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando,
    \rel, 4
).play(quant: 1);
)

(
~mandoFin6.stop;
~mandoFin6 = Pbind(
    \instrument, \mandoline,
	\dur, Pseq([6], inf),
    \spos, 1470000,
    \rate, Pseq([1 * ~invHar * -2.midiratio], inf),
    \amp, Pseq([5], inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando,
    \rel, 12
).play(quant: 1);
)


(
~beat1Amp.source = Pseq([1, 0, 2, 0], inf);
~newBeat1.stop;
~newBeat1 = Pbind(
    \instrument, "kick",
//     \dur, 1,
    \dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \att, 0.01,
    \rel, 0.22,
    \sinfreq, 60,
    \glissf, 0.9,
    \amp, 1,
).play(quant: 1);
)
(
~newBeat1b.stop;
~newBeat1b = Pbind(
    \instrument, \percu,
	\dur, Pseq([0.25, 0.25, 0.25, 0.125, 0.125], inf),
    \spos, 1717440,
    \rate, Pseq([1], inf),
    \amp, 0.35,
	\pan, Pwhite(-1, 1, inf),
    \buf, Pseq([~beats[4]], inf),
    \out, [~volumeBus, 0]
).play(quant: 1);
// ~beat1.stop;
// ~beat1.reset;
)