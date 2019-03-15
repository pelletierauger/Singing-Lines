// The ~toFreq function below is borrowed (and slightly adapted) from Derek Kwan. 
// The original function can be found here: 
// https://github.com/derekxkwan/sc-miscellany/blob/master/note-to-midi.scd
// Both the original and my fork are free software 
// licensed under the GNU General Public License v3.0.

(
~toFreq = {|note|
    var cleaned = note.asString.toLower;
    var octave_pair = cleaned.findRegexp("[0-9]+");
    var octave = if(octave_pair.size > 0, octave_pair[0][1], 4).asInt;
    var my_note = if(octave_pair.size > 0, cleaned.copyFromStart(octave_pair[0][0] - 1), cleaned);
    var note_name = my_note[0].asString;
    var midinote = 0;
    var detune = 0;
    if(my_note.size > 1,
    switch(my_note.copyToEnd(1),
        "b", {detune = -1},
        "bb", {detune = -2},
        "#", {detune = 1},
        "##", {detune = 2}
    ));
    switch(note_name,
        "c", {midinote = 12},
        "d", {midinote = 14},
        "e", {midinote = 16},
        "f", {midinote = 17},
        "g", {midinote = 19},
        "a", {midinote = 21},
        "b", {midinote = 23}
    );
    midinote = (midinote + (octave.clip(0,99999) * 12)) + detune;
    midinote = midinote.midicps;
};
)

~toFreq.("Gb4");