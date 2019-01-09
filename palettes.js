let palettes = [];

let Palette = function(o) {
    this.name = o.name;
    this.data = o.data;
    palettes.push(this);
};

function getPalette(pal) {
    let foundPalette = false;
    for (let i = 0; i < palettes.length; i++) {
        if (palettes[i].name === pal) {
            foundPalette = palettes[i];
        }
    }
    if (foundPalette) {
        return foundPalette;
    } else {
        logJavaScriptConsole("The requested palette does not exist.");
        return palette;
    }
}


let randomPalette = new Palette({
    name: "random",
    data: {
        blueMax: 94,
        blueMin: 101,
        blueOsc: 4,
        greenMax: 29,
        greenMin: 83,
        greenOsc: 3,
        redMax: 26,
        redMin: 227,
        redOsc: 9
    }
});

let randomPalette2 = new Palette({
    name: "random2",
    data: {
        blueMax: 224,
        blueMin: 191,
        blueOsc: 0,
        greenMax: 80,
        greenMin: 244,
        greenOsc: 9,
        redMax: 197,
        redMin: 183,
        redOsc: 8
    }
});

let randomPalette3 = new Palette({
    name: "random2",
    data: {
        blueMax: 66,
        blueMin: 68,
        blueOsc: 5,
        greenMax: 179,
        greenMin: 35,
        greenOsc: 8,
        redMax: 209,
        redMin: 54,
        redOsc: 4
    }
});

let randomPalette4 = new Palette({
    name: "random2",
    data: {
        blueMax: 197,
        blueMin: 35,
        blueOsc: 4,
        greenMax: 10,
        greenMin: 92,
        greenOsc: 6,
        redMax: 187,
        redMin: 7,
        redOsc: 6
    }
});

let randomPalette5 = new Palette({
    name: "random2",
    data: {
        blueMax: 212,
        blueMin: 84,
        blueOsc: 3,
        greenMax: 80,
        greenMin: 231,
        greenOsc: 1,
        redMax: 230,
        redMin: 4,
        redOsc: 2
    }
});

let randomPalette6 = new Palette({
    name: "random6",
    data: {
        blueMax: 89,
        blueMin: 71,
        blueOsc: 7,
        greenMax: 22,
        greenMin: 110,
        greenOsc: 2,
        redMax: 3,
        redMin: 227,
        redOsc: 8
    }
});

let randomPalette7 = new Palette({
    name: "random7",
    data: {
        blueMax: 89,
        blueMin: 71,
        blueOsc: 7,
        greenMax: 22,
        greenMin: 110,
        greenOsc: 2,
        redMax: 3,
        redMin: 227,
        redOsc: 8
    }
});

let randomPalette8 = new Palette({
    name: "random8",
    data: {
        blueMax: 103,
        blueMin: 90,
        blueOsc: 5,
        greenMax: 12,
        greenMin: 113,
        greenOsc: 4,
        redMax: 15,
        redMin: 234,
        redOsc: 6
    }
});

let randomPalette9 = new Palette({
    name: "random9",
    data: {
        blueMax: 105,
        blueMin: 46,
        blueOsc: 1,
        greenMax: 48,
        greenMin: 132,
        greenOsc: 7,
        redMax: 245,
        redMin: 26,
        redOsc: 1
    }
});

let randomPalette10 = new Palette({
    name: "random10",
    data: {
        blueMax: 98,
        blueMin: 124,
        blueOsc: 0,
        greenMax: 190,
        greenMin: 35,
        greenOsc: 1,
        redMax: 248,
        redMin: 66,
        redOsc: 2
    }
});

let randomPalette11 = new Palette({
    name: "random11",
    data: {
        blueMax: 32,
        blueMin: 246,
        blueOsc: 1,
        greenMax: 176,
        greenMin: 35,
        greenOsc: 1,
        redMax: 220,
        redMin: 13,
        redOsc: 5
    }
});

let randomPalette12 = new Palette({
    name: "random12",
    data: {
        blueMax: 46,
        blueMin: 217,
        blueOsc: 0,
        greenMax: 81,
        greenMin: 63,
        greenOsc: 2,
        redMax: 35,
        redMin: 217,
        redOsc: 3
    }
});

let randomPalette13 = new Palette({
    name: "random13",
    data: {
        blueMax: 211,
        blueMin: 16,
        blueOsc: 6,
        greenMax: 41,
        greenMin: 217,
        greenOsc: 8,
        redMax: 250,
        redMin: 188,
        redOsc: 5
    }
});

let randomPalette14 = new Palette({
    name: "random14",
    data: {
        blueMax: 221,
        blueMin: 113,
        blueOsc: 6,
        greenMax: 181,
        greenMin: 40,
        greenOsc: 0,
        redMax: 199,
        redMin: 11,
        redOsc: 2
    }
});

let randomPalette15 = new Palette({
    name: "random15",
    data: {
        blueMax: 7,
        blueMin: 23,
        blueOsc: 8,
        greenMax: 149,
        greenMin: 87,
        greenOsc: 6,
        redMax: 218,
        redMin: 191,
        redOsc: 4
    }
});

let randomPalette16 = new Palette({
    name: "random16",
    data: {
        blueMax: 17,
        blueMin: 60,
        blueOsc: 9,
        greenMax: 160,
        greenMin: 109,
        greenOsc: 9,
        redMax: 212,
        redMin: 97,
        redOsc: 6
    }
});

let randomPalette17 = new Palette({
    name: "wild",
    data: {
        blueMax: 86,
        blueMin: 158,
        blueOsc: 8,
        greenMax: 201,
        greenMin: 3,
        greenOsc: 6,
        redMax: 250,
        redMin: 6,
        redOsc: 1
    }
});

let randomPalette18 = new Palette({
    name: "wild",
    data: {
        blueMax: 66,
        blueMin: 63,
        blueOsc: 9,
        greenMax: 193,
        greenMin: 67,
        greenOsc: 7,
        redMax: 6,
        redMin: 201,
        redOsc: 5
    }
});

let randomPalette19 = new Palette({
    name: "lime-turquoise-rose",
    data: {
        blueMax: 7,
        blueMin: 202,
        blueOsc: 2,
        greenMax: 219,
        greenMin: 134,
        greenOsc: 5,
        redMax: 2,
        redMin: 127,
        redOsc: 5
    }
});

let randomPalette20 = new Palette({
    name: "random20",
    data: {
        blueMax: 47,
        blueMin: 203,
        blueOsc: 2,
        greenMax: 151,
        greenMin: 69,
        greenOsc: 6,
        redMax: 99,
        redMin: 31,
        redOsc: 1
    }
});

let randomPalette21 = new Palette({
    name: "random21",
    data: {
        blueMax: 97,
        blueMin: 248,
        blueOsc: 8,
        greenMax: 180,
        greenMin: 3,
        greenOsc: 1,
        redMax: 56,
        redMin: 105,
        redOsc: 2
    }
});

let randomPalette22 = new Palette({
    name: "random22",
    data: {
        blueMax: 145,
        blueMin: 69,
        blueOsc: 1,
        greenMax: 36,
        greenMin: 246,
        greenOsc: 3,
        redMax: 75,
        redMin: 28,
        redOsc: 4
    }
});

let randomPalette23 = new Palette({
    name: "random23",
    data: {
        blueMax: 197,
        blueMin: 199,
        blueOsc: 9,
        greenMax: 11,
        greenMin: 128,
        greenOsc: 1,
        redMax: 45,
        redMin: 183,
        redOsc: 3
    }
});

let randomPalette24 = new Palette({
    name: "random24",
    data: {
        blueMax: 119,
        blueMin: 13,
        blueOsc: 0,
        greenMax: 53,
        greenMin: 184,
        greenOsc: 7,
        redMax: 228,
        redMin: 32,
        redOsc: 1
    }
});

let randomPalette25 = new Palette({
    name: "random25",
    data: {
        blueMax: 47,
        blueMin: 176,
        blueOsc: 7,
        greenMax: 233,
        greenMin: 47,
        greenOsc: 3,
        redMax: 78,
        redMin: 114,
        redOsc: 6
    }
});

let randomPalette26 = new Palette({
    name: "random26",
    data: {
        blueMax: 12,
        blueMin: 203,
        blueOsc: 9,
        greenMax: 73,
        greenMin: 86,
        greenOsc: 9,
        redMax: 205,
        redMin: 80,
        redOsc: 2
    }
});

let randomPalette27 = new Palette({
    name: "random27",
    data: {
        blueMax: 214,
        blueMin: 253,
        blueOsc: 9,
        greenMax: 75,
        greenMin: 225,
        greenOsc: 2,
        redMax: 201,
        redMin: 88,
        redOsc: 1
    }
});

let randomPalette28 = new Palette({
    name: "random28",
    data: {
        blueMax: 23,
        blueMin: 21,
        blueOsc: 5,
        greenMax: 226,
        greenMin: 39,
        greenOsc: 6,
        redMax: 166,
        redMin: 22,
        redOsc: 7
    }
});

let randomPalette29 = new Palette({
    name: "beautiful-pastels",
    data: {
        blueMax: 7,
        blueMin: 246,
        blueOsc: 8,
        greenMax: 130,
        greenMin: 34,
        greenOsc: 6,
        redMax: 240,
        redMin: 60,
        redOsc: 2
    }
});

let randomPalette30 = new Palette({
    name: "red-blue-vaguely-wild",
    data: {
        blueMax: 79,
        blueMin: 49,
        blueOsc: 9,
        greenMax: 246,
        greenMin: 97,
        greenOsc: 0,
        redMax: 13,
        redMin: 224,
        redOsc: 3
    }
});

let randomPalette31 = new Palette({
    name: "forest",
    data: {
        blueMax: 125,
        blueMin: 154,
        blueOsc: 0,
        greenMax: 220,
        greenMin: 66,
        greenOsc: 6,
        redMax: 252,
        redMin: 126,
        redOsc: 8
    }
});

let randomPalette32 = new Palette({
    name: "wild-and-pink",
    data: {
        blueMax: 78,
        blueMin: 21,
        blueOsc: 8,
        greenMax: 137,
        greenMin: 11,
        greenOsc: 1,
        redMax: 226,
        redMin: 200,
        redOsc: 7
    }
});

let randomPalette33 = new Palette({
    name: "fast-pink-blue-marine-green",
    data: {
        blueMax: 42,
        blueMin: 106,
        blueOsc: 1,
        greenMax: 114,
        greenMin: 20,
        greenOsc: 4,
        redMax: 231,
        redMin: 6,
        redOsc: 8
    }
});

let randomPalette34 = new Palette({
    name: "random34",
    data: {
        blueMax: 100,
        blueMin: 25,
        blueOsc: 9,
        greenMax: 205,
        greenMin: 13,
        greenOsc: 8,
        redMax: 29,
        redMin: 203,
        redOsc: 6
    }
});

let randomPalette35 = new Palette({
    name: "just-green-and-blue-but-nice",
    data: {
        blueMax: 26,
        blueMin: 146,
        blueOsc: 5,
        greenMax: 23,
        greenMin: 152,
        greenOsc: 6,
        redMax: 75,
        redMin: 111,
        redOsc: 0
    }
});

let randomPalette36 = new Palette({
    name: "collection-of-pinks",
    data: {
        blueMax: 191,
        blueMin: 30,
        blueOsc: 8,
        greenMax: 18,
        greenMin: 179,
        greenOsc: 3,
        redMax: 248,
        redMin: 169,
        redOsc: 2
    }
});

let randomPalette37 = new Palette({
    name: "random37",
    data: {
        blueMax: 177,
        blueMin: 26,
        blueOsc: 3,
        greenMax: 144,
        greenMin: 23,
        greenOsc: 6,
        redMax: 26,
        redMin: 222,
        redOsc: 7
    }
});

let randomPalette38 = new Palette({
    name: "fast-purples-and-greens",
    data: {
        blueMax: 25,
        blueMin: 88,
        blueOsc: 4,
        greenMax: 195,
        greenMin: 59,
        greenOsc: 2,
        redMax: 164,
        redMin: 48,
        redOsc: 6
    }
});

let randomPalette39 = new Palette({
    name: "fairly-fast-strawberries",
    data: {
        blueMax: 48,
        blueMin: 132,
        blueOsc: 6,
        greenMax: 214,
        greenMin: 3,
        greenOsc: 4,
        redMax: 172,
        redMin: 236,
        redOsc: 3
    }
});

let randomPalette40 = new Palette({
    name: "laser-show",
    data: {
        blueMax: 74,
        blueMin: 101,
        blueOsc: 1,
        greenMax: 69,
        greenMin: 200,
        greenOsc: 1,
        redMax: 216,
        redMin: 46,
        redOsc: 2
    }
});

let randomPalette41 = new Palette({
    name: "lime-and-light-purple-fairly-fast",
    data: {
        blueMax: 104,
        blueMin: 174,
        blueOsc: 4,
        greenMax: 65,
        greenMin: 243,
        greenOsc: 2,
        redMax: 107,
        redMin: 61,
        redOsc: 6
    }
});

let randomPalette42 = new Palette({
    name: "magic-hour",
    data: {
        blueMax: 142,
        blueMin: 94,
        blueOsc: 7,
        greenMax: 61,
        greenMin: 159,
        greenOsc: 4,
        redMax: 110,
        redMin: 254,
        redOsc: 6
    }
});

let randomPalette43 = new Palette({
    name: "blue-hour",
    data: {
        blueMax: 244,
        blueMin: 159,
        blueOsc: 6,
        greenMax: 139,
        greenMin: 19,
        greenOsc: 4,
        redMax: 43,
        redMin: 246,
        redOsc: 4
    }
});

let randomPalette44 = new Palette({
    name: "fairly-wild-green-and-dark-pink",
    data: {
        blueMax: 16,
        blueMin: 45,
        blueOsc: 6,
        greenMax: 240,
        greenMin: 6,
        greenOsc: 2,
        redMax: 206,
        redMin: 148,
        redOsc: 2
    }
});

let randomPalette45 = new Palette({
    name: "pastel-tornado",
    data: {
        blueMax: 105,
        blueMin: 159,
        blueOsc: 9,
        greenMax: 195,
        greenMin: 64,
        greenOsc: 1,
        redMax: 151,
        redMin: 243,
        redOsc: 2
    }
});

let randomPalette46 = new Palette({
    name: "fuzzy-fast-greens",
    data: {
        blueMax: 20,
        blueMin: 57,
        blueOsc: 2,
        greenMax: 232,
        greenMin: 71,
        greenOsc: 1,
        redMax: 125,
        redMin: 6,
        redOsc: 7
    }
});

let randomPalette47 = new Palette({
    name: "getting-tired-blue-green-red",
    data: {
        blueMax: 38,
        blueMin: 11,
        blueOsc: 3,
        greenMax: 223,
        greenMin: 14,
        greenOsc: 3,
        redMax: 236,
        redMin: 11,
        redOsc: 6
    }
});

let randomPalette48 = new Palette({
    name: "darker-pastel-tornado",
    data: {
        blueMax: 21,
        blueMin: 79,
        blueOsc: 8,
        greenMax: 51,
        greenMin: 149,
        greenOsc: 2,
        redMax: 254,
        redMin: 69,
        redOsc: 1
    }
});

let randomPalette49 = new Palette({
    name: "cool-blues-and-pinks-and-marine-green",
    data: {
        blueMax: 242,
        blueMin: 116,
        blueOsc: 5,
        greenMax: 180,
        greenMin: 79,
        greenOsc: 3,
        redMax: 21,
        redMin: 216,
        redOsc: 2
    }
});

let randomPalette50 = new Palette({
    name: "warm-and-fuzzy-pinks-and-purples",
    data: {
        blueMax: 32,
        blueMin: 207,
        blueOsc: 2,
        greenMax: 104,
        greenMin: 32,
        greenOsc: 1,
        redMax: 105,
        redMin: 248,
        redOsc: 5
    }
});

let randomPalette51 = new Palette({
    name: "wild-and-happy",
    data: {
        blueMax: 28,
        blueMin: 210,
        blueOsc: 9,
        greenMax: 55,
        greenMin: 242,
        greenOsc: 3,
        redMax: 253,
        redMin: 93,
        redOsc: 2
    }
});

let randomPalette52 = new Palette({
    name: "pink-purple-marine-green",
    data: {
        blueMax: 155,
        blueMin: 153,
        blueOsc: 3,
        greenMax: 231,
        greenMin: 7,
        greenOsc: 3,
        redMax: 109,
        redMin: 221,
        redOsc: 2
    }
});

let randomPalette53 = new Palette({
    name: "fairly-nice-fast-forest",
    data: {
        blueMax: 110,
        blueMin: 214,
        blueOsc: 0,
        greenMax: 8,
        greenMin: 155,
        greenOsc: 8,
        redMax: 210,
        redMin: 4,
        redOsc: 2
    }
});

let randomPalette54 = new Palette({
    name: "big-bright-rainbow",
    data: {
        blueMax: 18,
        blueMin: 110,
        blueOsc: 4,
        greenMax: 215,
        greenMin: 7,
        greenOsc: 3,
        redMax: 200,
        redMin: 45,
        redOsc: 2
    }
});

let randomPalette55 = new Palette({
    name: "salmon-rainbow",
    data: {
        blueMax: 137,
        blueMin: 19,
        blueOsc: 7,
        greenMax: 124,
        greenMin: 39,
        greenOsc: 6,
        redMax: 2,
        redMin: 162,
        redOsc: 4
    }
});