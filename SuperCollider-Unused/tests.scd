[1, 2, 3].stutter(1).postln;


(
// ~startChirpsLow = {
    ~chirpsLow.stop;
    ~chirpsLow = Pbind(
        \instrument, \pulse,
        \dur, Pseq([0.125 * 8] * 0.5 * 0.25, inf),
        \freq, Pseq([
            415.30 * ~har * 2,
           349.23 * ~invHar * 2,
            277.18 * ~har * 2,
            69.30 * ~har * 8 * 4.midiratio,
           415.30 * ~har * 2,
           349.23 * ~invHar * 2,
            277.18 * ~har * 2 * 2.midiratio,
            69.30 * ~har * 8 * 0.midiratio
        ].stutter(8) * 0.25,
        inf) * Pseq([1, 0.5], inf),
        \atk, 0.01,
        \sus, 2,
        \pan, Pwhite(-0.5, 0.5, inf),
        \amp, 3,
        \out, [~volumeBus, 0]
    ).play(quant: [1, 0.5]);
// };
)

[554.35, 466.16, 369.99, 466.19, 554.35, 466.16, 415.30, 370.01] * 7.midiratio;


554.38 * -7.midiratio;

(

// build a table of note names

var table = ();

value {

	var semitones = [0, 2, 4, 5, 7, 9, 11];

	var naturalNoteNames = ["c", "d", "e", "f", "g", "a", "b"];



	(0..9).do {|o|

		naturalNoteNames.do {|c, i|

			var n = (o + 1) * 12 + semitones[i];

			table[(c ++ o).asSymbol] = n;

			table[(c ++ "s"  ++ o).asSymbol] = n + 1;

			table[(c ++ "ss" ++ o).asSymbol] = n + 2;

			table[(c ++ "b"  ++ o).asSymbol] = n - 1;

			table[(c ++ "bb" ++ o).asSymbol] = n - 2;

		};

	};

};



// translate note names to midi keys

table.atAll(#[c4, e4, gs4, c5, e5, gs5, c6])
table(#)
)

c1;