s.boot;

~b1 = Buffer.read(s, "/Users/guillaumepelletier/Desktop/Dropbox/Création musicale/Projets Ableton Live/Avec Caroline Project/Samples/Recorded/0002 7-Audio.aif");
~b1.numFrames;

(
SynthDef(\bpfbuff, {
    arg buf = ~b1, rate = 1, spos = 0, pan = 1, amp = 1;
    var sig, env, lfo;
    env = EnvGen.kr(Env.new([0, 1, 0.5, 0], [0.1, 0.15, 0.75]), doneAction: 2);
    sig = PlayBuf.ar(2, ~b1, rate * BufRateScale.ir(buf), startPos: spos);
    sig = sig * env;
    sig = sig * amp;
    sig = Balance2.ar(sig[0], sig[1], pan, 1);
    Out.ar(0, sig);
}).add;
)

~speed = 0.005;
~speed = 0.015;

~speed = {0.015};
~dur = PatternProxy(Pn(0.25, inf));
~har = PatternProxy(Pn(0, inf));
~loc = PatternProxy(Pn(400000, inf));
(
p.stop;
a = 400000;
p = Pbind(
	\instrument, \bpfbuff,
	\dur, Pseq([~dur], inf),
	\spos, Pwhite(1047552 - 850000 + ~loc, 1047552 - 840000 + ~loc, inf).round,
	\rate, Pseq([1 * ~har.midiratio, 1 * 5.midiratio, 1 * -7.midiratio], inf),
	\pan, Pwhite(-1, 1, inf)
).play;
)

~dur.source = Pn(0.005, inf);
~har.source = Pn(0, inf);
~har.source = Pn(-2, inf);
~har.source = Pn(2, inf);
~loc.source = Pn(420000, inf);

(
OSCdef.new(
	\intense,
	{
		arg msg, time, addr, port;
		~dur.source = Pn(msg[1], inf);
	},
	'/intensity'
);
)

(
OSCdef.new(
	\harmonious,
	{
		arg msg, time, addr, port;
		~har.source = Pn(msg[1], inf);
	},
	'/har'
);
)

(
OSCdef.new(
	\harmonious,
	{
		arg msg, time, addr, port;
		~loc.source = Pn(msg[1], inf);
	},
	'/loc'
);
)
// ~dur.postln;