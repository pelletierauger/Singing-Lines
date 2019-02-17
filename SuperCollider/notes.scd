(
~myFirstFunction = {
    ~beat1.play(quant: 1);
    ~beat4.play(quant: 1);
};
)
~myFirstFunction.value;

PatternProxy.defaultQuant = 1;

f = { "Function evaluated".postln; };
f.value;

~beat1Amp = PatternProxy(Pseq([1, 0, 0, 0], inf));
PatternProxy.defaultQuant = 1;
PatternProxy.defaultQuant;
~beat1.play(quant: 1);
~beat1Amp.source = Pseq([1, 0, 2, 0], inf);
PatternProxy.defaultValue;
~beat1Amp.quant = 1;





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
    \amp, Pseq([~volMando] * 0.5, inf),
	\pan, Pwhite(-1, 1, inf),
    \buf, ~mando
).play(quant: 1);
)

